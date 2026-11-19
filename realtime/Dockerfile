# AiSOC realtime: WebSocket and SSE fan-out of alerts to the console.
FROM ghcr.io/beenuar/aisoc-realtime:v23.5.2@sha256:0e4e1ba314b0905c1b65ce9fd705706f023419e0e57af1c0d53c6196a2fb9a6e
ENV NODE_ENV=production \
    ENVIRONMENT=production \
    AISOC_ALLOW_CLEARTEXT_KAFKA=1 \
    PORT=4000
CMD ["node", "dist/index.js"]
