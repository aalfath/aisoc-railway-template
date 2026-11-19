"""Wait until DATABASE_URL accepts a login (up to about 5 minutes).

The api service creates the runtime role's password (aisoc_app) while it applies the
migrations. Services that start before that would cache a failed connection pool, so
they wait here first."""
import asyncio
import os
import sys
import time

import asyncpg


async def main() -> int:
    url = os.environ.get("DATABASE_URL", "")
    if not url:
        return 0
    url = url.replace("postgresql+asyncpg://", "postgresql://", 1).split("?", 1)[0]
    deadline = time.monotonic() + 300
    while True:
        try:
            conn = await asyncpg.connect(url, timeout=5)
            await conn.close()
            return 0
        except Exception as exc:  # noqa: BLE001
            if time.monotonic() > deadline:
                print(f"[aisoc] database login still failing ({type(exc).__name__}); starting anyway", file=sys.stderr)
                return 0
            print(f"[aisoc] waiting for the database login ({type(exc).__name__})", file=sys.stderr)
            await asyncio.sleep(5)


sys.exit(asyncio.run(main()))
