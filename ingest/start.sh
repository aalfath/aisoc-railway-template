#!/bin/sh
# The ingest service reads HTTP_PORT; Railway routes and health-checks PORT.
set -e
export HTTP_PORT="${PORT:-8080}"
exec ./ingest-service
