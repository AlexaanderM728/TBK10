FROM node:alpine

ENV MAX_ALLOCATION_MB=4096 \
    LOOP_ALLOCATION_MB=512 \
    LOOP_INTERVAL_MS=2000

CMD ["node", "memory-hog.js" ,"LOOP_ALLOCATION_MB" ]


WORKDIR /app
COPY / .

HEALTHCHECK --interval=5s \
        --timeout=30s \
        --start-period=5s \
        --retries=3 \
        CMD ["node", "memory-check.js", "ALLOCATED_MB"] || exit 1

        