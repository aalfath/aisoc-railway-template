# AiSOC connectors: the connector catalogue and pull connectors for EDR, SIEM, identity and cloud tools.
FROM ghcr.io/beenuar/aisoc-connectors:v23.5.2@sha256:964a8ef7ea96aeecaf0287aba299372756e5b0977a1ee7f0ef808ed9ddd062bf
ENV ENVIRONMENT=production \
    AISOC_DEV_MODE=0 \
    AISOC_PUBLISHED_BIND_ADDRS=0.0.0.0 \
    AISOC_ALLOW_CLEARTEXT_DB=1 \
    AISOC_ALLOW_CLEARTEXT_KAFKA=1 \
    PORT=8003
COPY start.sh /usr/local/bin/aisoc-start
COPY credential-key.sh /usr/local/bin/aisoc-credential-key
RUN chmod 755 /usr/local/bin/aisoc-start
CMD ["/usr/local/bin/aisoc-start"]
