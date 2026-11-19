#!/bin/sh
set -e
. /usr/local/bin/aisoc-credential-key
python /usr/local/lib/aisoc-wait-db.py
exec python -m app.scripts.serve
