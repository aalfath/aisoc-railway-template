# AiSOC console (Next.js). The browser only talks to this service; it proxies
# /api, /auth, /ws and /sse to the other services over the private network.
FROM ghcr.io/beenuar/aisoc-web:v23.5.2@sha256:10425e2104fad3f91f84398d4e08f960b47b67df743fc8c04f370552b74c991b
ENV NODE_ENV=production \
    AISOC_DEMO_MODE=false \
    NEXT_TELEMETRY_DISABLED=1 \
    HOSTNAME=:: \
    PORT=3000
ENTRYPOINT ["/app/apps/web/docker-entrypoint.sh"]
CMD ["sh", "-c", "exec pnpm exec next start -H \"${HOSTNAME:-::}\" -p \"${PORT:-3000}\""]
