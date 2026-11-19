# AiSOC fusion: detection, correlation and incident grouping off the Kafka stream.
FROM ghcr.io/beenuar/aisoc-fusion:v23.5.2@sha256:746b6a7c715a1d348a672f30be397b0abdb1150c72cdd2c8ed8ef267bc844399
ENV ENVIRONMENT=production \
    AISOC_DEV_MODE=0 \
    AISOC_PUBLISHED_BIND_ADDRS=0.0.0.0 \
    AISOC_ALLOW_CLEARTEXT_DB=1 \
    AISOC_ALLOW_CLEARTEXT_KAFKA=1 \
    AISOC_LAKE_WRITER_ENABLED=false \
    PORT=8003
COPY serve.py /usr/local/lib/aisoc-serve.py
CMD ["python", "/usr/local/lib/aisoc-serve.py"]
