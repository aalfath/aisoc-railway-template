[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template/aisoc?utm_medium=integration&utm_source=button&utm_campaign=aisoc)

# Deploy and Host AiSOC on Railway

AiSOC is an open-source (MIT), self-hosted AI Security Operations Center. It ingests security telemetry, runs detection rules, fuses related alerts into incidents, triages them with AI agents whose every prompt and tool call is recorded in a replayable decision ledger, and maps findings to MITRE ATT&CK. Analysts work cases in a web console.

## About Hosting AiSOC

AiSOC is a set of cooperating services: a FastAPI core API that owns the database schema, a Next.js console, an AI agents service, a realtime WebSocket gateway, an ingest gateway, alert fusion, connectors and response actions. They share PostgreSQL (with row-level security), Redis and a Kafka-compatible event bus. This template runs AiSOC v23.5.2 as nine services built from one GitHub repo plus Railway's PostgreSQL and Redis. On the first deploy the API applies all SQL migrations, sets the runtime database role's password and creates the first administrator with a generated password. Only the console is public; everything else talks over Railway's private network.

## Common Use Cases

* Run a self-hosted SOC console that collects alerts from security tools and groups them into incidents
* Triage alerts with an LLM agent (OpenAI, Anthropic or an OpenAI-compatible endpoint) while keeping an auditable record of every agent step
* Investigate incidents against MITRE ATT&CK and manage cases, with a human approving any response action

## Dependencies for AiSOC Hosting

* PostgreSQL (Railway Postgres)
* Redis (Railway Redis)

### Deployment Dependencies

* AiSOC: https://github.com/beenuar/AiSOC
* AiSOC documentation: https://beenuar.github.io/AiSOC/
* Template source: https://github.com/aalfath/aisoc-railway-template
* Redpanda (Kafka-compatible event bus): https://github.com/redpanda-data/redpanda

### Implementation Details

**Signing in.** Open the `web` service's public URL. Sign in with `AISOC_ADMIN_EMAIL` (default `admin@example.com`) and the generated `AISOC_ADMIN_PASSWORD`, both shown in the `api` service's Variables tab. Change the password in the console after the first login. The administrator is created only once, so later deploys never overwrite a password you changed.

**Services.** `web` (console, public), `api` (core API and migrations), `agents`, `realtime`, `ingest`, `fusion`, `connectors`, `actions`, `redpanda` (event bus, volume `/var/lib/redpanda/data`), plus `Postgres` and `Redis`. The `agents` service keeps playbooks on a volume at `/data`. Every service has a health check and restarts on failure.

**Secrets.** The session key, JWT secret, credential-vault key, runtime database password and service-to-service tokens are generated per deployment and live on the `api` service. The other services reference them, so no secret is shared between deployments.

**AI triage (optional).** Without an LLM key AiSOC falls back to deterministic triage. To use a model, add `OPENAI_API_KEY` (or `ANTHROPIC_API_KEY`, or `OPENAI_BASE_URL` for an OpenAI-compatible endpoint) to the `agents` and `api` services. SMTP, SSO and connectors to your security tools are set up in the console or with extra variables; see the AiSOC docs.

**Not included.** Upstream's optional ClickHouse, Neo4j, Qdrant, LiteLLM gateway and bundled Ollama model are switched off to keep the template small. The core SOC workflow (ingest, fusion, alerts, cases, triage) works without them.

**Sizing.** Upstream recommends 8 GB of memory for a full install. Expect several GB across all services under load.

**Updates.** The template's services build from [aalfath/aisoc-railway-template](https://github.com/aalfath/aisoc-railway-template). When a new AiSOC version is merged there, Railway shows an update notice on your project and you choose when to apply it. Read `CHANGELOG.md` first. Migrations run automatically when the `api` service starts.

## Why Deploy AiSOC on Railway?

<!-- Recommended: Keep this section as shown below -->
Railway is a singular platform to deploy your infrastructure stack. Railway will host your infrastructure so you don't have to deal with configuration, while allowing you to vertically and horizontally scale it.

By deploying AiSOC on Railway, you are one step closer to supporting a complete full-stack application with minimal burden. Host your servers, databases, AI agents, and more on Railway.
<!-- End recommended section -->
