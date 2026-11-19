# AiSOC actions: response actions (host isolation, account disablement, ...) behind an approval queue.
FROM ghcr.io/beenuar/aisoc-actions:v23.5.2@sha256:9145423e232f37ad5015e4c5255e04f5127c5de3f3cbab19b162b43bc9e8d1f0
ENV ENVIRONMENT=production \
    AISOC_DEV_MODE=0 \
    AISOC_PUBLISHED_BIND_ADDRS=0.0.0.0 \
    AISOC_ALLOW_CLEARTEXT_DB=1 \
    AISOC_ALLOW_CLEARTEXT_KAFKA=1 \
    PORT=8085
COPY serve.py /usr/local/lib/aisoc-serve.py
CMD ["python", "/usr/local/lib/aisoc-serve.py"]
