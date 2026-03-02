# Stage 1: Build
FROM node:22-alpine AS builder

RUN corepack enable && corepack prepare pnpm@latest --activate

WORKDIR /app

COPY generated/node/package.json generated/node/pnpm-lock.yaml* ./
RUN pnpm install --frozen-lockfile 2>/dev/null || pnpm install

COPY generated/node/ ./

# Stage 2: Production
FROM node:22-alpine

RUN corepack enable && corepack prepare pnpm@latest --activate
RUN apk add --no-cache curl

WORKDIR /app

COPY --from=builder /app/package.json /app/pnpm-lock.yaml* ./
RUN pnpm install --prod --frozen-lockfile 2>/dev/null || pnpm install --prod

COPY --from=builder /app/ ./

RUN mkdir -p /data

ENV PLT_SERVER_PORT=3042
ENV PLT_LOG_LEVEL=info
ENV DATABASE_PATH=/data/flusk.db

EXPOSE 3042

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl -f http://localhost:3042/api/health || exit 1

CMD ["pnpm", "start"]
