#!/bin/sh
# Applies the SQL migration chain as the database owner, sets the password of the
# row-level-security runtime role (aisoc_app), creates the first administrator once,
# then starts the API. Every step is idempotent, so it runs on every deploy.
set -e
. /usr/local/bin/aisoc-credential-key
export AISOC_ADMIN_EMAIL="${AISOC_ADMIN_EMAIL:-admin@aisoc.internal}"
mkdir -p "${AISOC_PLUGINS_DIR:-/opt/aisoc/plugins}" "${PLUGIN_TRUSTED_KEYS_DIR:-/opt/aisoc/plugin-keys}"

i=0
until python -m app.scripts.run_migrations; do
  i=$((i+1))
  if [ "$i" -ge 30 ]; then echo "[aisoc] migrations failed 30 times, giving up" >&2; exit 1; fi
  echo "[aisoc] migrations not applied yet (database starting?), retry $i/30 in 5 s" >&2
  sleep 5
done

# Creates the administrator on first boot with AISOC_ADMIN_PASSWORD. Once it exists
# this only reports it, so a password changed in the console is never overwritten.
# Lines mentioning the password are kept out of the deploy log.
python -m app.scripts.bootstrap_admin 2>&1 | grep -v -i 'password' || true

exec python -m app.scripts.serve
