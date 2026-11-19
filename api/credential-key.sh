# Sourced by the start script. AISOC_CREDENTIAL_KEY must be a Fernet key (32 bytes,
# url-safe base64). Railway's ${{secret()}} can't produce that format directly, so a
# value that isn't already a Fernet key is turned into one with SHA-256. The api and
# connectors services share the same variable, so they derive the same key.
if [ -n "${AISOC_CREDENTIAL_KEY:-}" ]; then
  AISOC_CREDENTIAL_KEY="$(python - <<'PY'
import base64, hashlib, os
raw = os.environ["AISOC_CREDENTIAL_KEY"].strip()
try:
    ok = len(base64.urlsafe_b64decode(raw.encode())) == 32 and len(raw) == 44
except Exception:
    ok = False
print(raw if ok else base64.urlsafe_b64encode(hashlib.sha256(raw.encode()).digest()).decode())
PY
)"
  export AISOC_CREDENTIAL_KEY
fi
