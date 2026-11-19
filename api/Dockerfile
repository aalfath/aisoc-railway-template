# AiSOC core API: FastAPI service, SQL migrations and the first administrator.
FROM ghcr.io/beenuar/aisoc-core-api:v23.5.2@sha256:7de8c37c0cc080e93ac3b17efc57fba7b607b700aedc261f9f5a890d5f822186
ENV ENVIRONMENT=production \
    AISOC_DEV_MODE=0 \
    AISOC_PUBLISHED_BIND_ADDRS=0.0.0.0 \
    AISOC_ALLOW_CLEARTEXT_DB=1 \
    AISOC_ALLOW_CLEARTEXT_KAFKA=1 \
    AISOC_DISABLE_CLICKHOUSE=true \
    AISOC_DISABLE_NEO4J=true \
    AISOC_DISABLE_QDRANT=true \
    PORT=8000
COPY start.sh /usr/local/bin/aisoc-start
COPY credential-key.sh /usr/local/bin/aisoc-credential-key
COPY owner-role.py /usr/local/lib/aisoc-owner-role.py
RUN chmod 755 /usr/local/bin/aisoc-start
CMD ["/usr/local/bin/aisoc-start"]
