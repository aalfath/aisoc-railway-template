#!/bin/sh
# Single-node broker on the private network. Kafka API on 9092, admin API (health
# check: /v1/status/ready) on PORT (9644). Data lives on the volume at
# /var/lib/redpanda/data. Topics are created on first use.
set -e
HOST="${RAILWAY_PRIVATE_DOMAIN:-${REDPANDA_ADVERTISE_HOST:-redpanda}}"
DATA=/var/lib/redpanda/data
mkdir -p "$DATA"
rm -r "$DATA/lost+found" 2>/dev/null || true
exec rpk redpanda start \
  --kafka-addr "internal://[::]:9092" \
  --advertise-kafka-addr "internal://${HOST}:9092" \
  --rpc-addr "[::]:33145" \
  --advertise-rpc-addr "${HOST}:33145" \
  --mode dev-container \
  --smp 1 \
  --memory "${REDPANDA_MEMORY:-1G}" \
  --reserve-memory 0M \
  --default-log-level=warn \
  --set "redpanda.admin=[{address: '::', port: ${PORT:-9644}}]"
