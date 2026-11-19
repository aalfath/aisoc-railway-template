#!/bin/sh
set -e
python /usr/local/lib/aisoc-wait-db.py
exec python /usr/local/lib/aisoc-serve.py
