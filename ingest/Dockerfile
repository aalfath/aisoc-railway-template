# AiSOC ingest: authenticated event intake, OCSF normalisation, publishes to Kafka.
FROM ghcr.io/beenuar/aisoc-ingest:v23.5.2@sha256:cc5f3487f7913408b2c89e0b25e497424eb97d90a3b1673f89bec24fa9cd1d49
ENV ENV=production \
    ENVIRONMENT=production \
    AISOC_ALLOW_CLEARTEXT_DB=1 \
    AISOC_ALLOW_CLEARTEXT_KAFKA=1 \
    AISOC_PUBLISHED_BIND_ADDRS=0.0.0.0 \
    ATTCK_DATA_PATH=/app/data/enterprise-attack.json \
    METRICS_PORT=9090 \
    PORT=8080
COPY start.sh /usr/local/bin/aisoc-start
RUN chmod 755 /usr/local/bin/aisoc-start
CMD ["/usr/local/bin/aisoc-start"]
