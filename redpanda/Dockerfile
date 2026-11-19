# Redpanda: a single-node Kafka-API broker for AiSOC's event pipeline.
FROM redpandadata/redpanda:v26.2.7@sha256:43545ee03966431f5451e0b3c1e651b39fbe3eb383360220311021f50133b649
# Railway volumes are owned by root.
USER root
ENV PORT=9644 \
    REDPANDA_MEMORY=1G
COPY start.sh /usr/local/bin/aisoc-redpanda
RUN chmod 755 /usr/local/bin/aisoc-redpanda
ENTRYPOINT ["/usr/local/bin/aisoc-redpanda"]
