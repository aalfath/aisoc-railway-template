"""Create the NOLOGIN role "aisoc" that AiSOC's migrations name as a schema owner."""
import asyncio
import os

import asyncpg


async def main() -> None:
    url = os.environ.get("DATABASE_MIGRATION_URL") or os.environ["DATABASE_URL"]
    url = url.replace("postgresql+asyncpg://", "postgresql://", 1).split("?", 1)[0]
    conn = await asyncpg.connect(url, timeout=10)
    try:
        await conn.execute(
            """
            DO $$
            BEGIN
                IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'aisoc') THEN
                    CREATE ROLE aisoc NOLOGIN;
                END IF;
            END $$;
            """
        )
    finally:
        await conn.close()


asyncio.run(main())
