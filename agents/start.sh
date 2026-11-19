#!/bin/sh
# Playbooks created in the console are stored as JSON under PLAYBOOK_STORE_DIR,
# which sits on the service's volume (/data).
set -e
mkdir -p "${PLAYBOOK_STORE_DIR:-/data/playbooks}"
python /usr/local/lib/aisoc-wait-db.py
exec python -m app.scripts.serve
