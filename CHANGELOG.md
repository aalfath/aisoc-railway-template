# Changelog

Entries list breaking changes first. Read the entry before you apply an update on Railway.

## v23.5.2-1 (2026-11-19)

- README: Deploy on Railway button for the published template (`aisoc`). No change to the services.

## v23.5.2 (2026-11-19)

- First version of the template: AiSOC v23.5.2 (official `ghcr.io/beenuar/aisoc-*` images pinned by digest) with Redpanda v26.2.7, Railway Postgres and Railway Redis.
- The API applies all migrations and creates the first administrator (`AISOC_ADMIN_EMAIL`, generated `AISOC_ADMIN_PASSWORD`) on first boot.
- ClickHouse, Neo4j, Qdrant, the LiteLLM gateway and the bundled Ollama model are disabled.
