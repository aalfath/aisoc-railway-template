#!/bin/sh
set -e
. /usr/local/bin/aisoc-credential-key
exec python -m app.scripts.serve
