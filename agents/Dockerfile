# AiSOC agents: LangGraph triage and investigation agents, playbooks, hunts, copilot.
FROM ghcr.io/beenuar/aisoc-agents:v23.5.2@sha256:b1fdb3a363acb2c7f3b6af2ada85bafb859ae9a0d3e6542966d125684297c9ce
ENV ENVIRONMENT=production \
    AISOC_DEV_MODE=0 \
    AISOC_PUBLISHED_BIND_ADDRS=0.0.0.0 \
    AISOC_ALLOW_CLEARTEXT_DB=1 \
    AISOC_ALLOW_CLEARTEXT_KAFKA=1 \
    AISOC_DISABLE_NEO4J=true \
    AISOC_DISABLE_QDRANT=true \
    KAFKA_TOPIC_ALERTS_FUSED=aisoc.alerts.fused \
    ATTCK_DATA_PATH=/app/data/enterprise-attack.json \
    PLAYBOOK_STORE_DIR=/data/playbooks \
    PORT=8084
COPY start.sh /usr/local/bin/aisoc-start
RUN chmod 755 /usr/local/bin/aisoc-start
CMD ["/usr/local/bin/aisoc-start"]
