# ===========================================
# Freebox Dashboard - Home Assistant Add-on Wrapper
# Downloads and runs the latest version from the original repo
# ===========================================

ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:latest
FROM ${BUILD_FROM}

# Install dependencies
RUN apk add --no-cache \
    nodejs \
    npm \
    git \
    wget \
    bash

# Set working directory
WORKDIR /app

# Download the latest release from the original repository
RUN git clone --depth 1 https://github.com/HgHugo/FreeboxOS-Ultra-Dashboard.git /tmp/freebox && \
    cp -r /tmp/freebox/* /app/ && \
    rm -rf /tmp/freebox

# Install dependencies
RUN npm ci && npm cache clean --force

# Build frontend
RUN npm run build

# Create data directory for persistent token storage
RUN mkdir -p /data

# Copy rootfs for Home Assistant
COPY rootfs/ /

# Environment variables with defaults
ENV NODE_ENV=production
ENV PORT=3000
ENV FREEBOX_TOKEN_FILE=/data/freebox_token.json
ENV FREEBOX_HOST=mafreebox.freebox.fr

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:${PORT}/api/health || exit 1

# Expose port
EXPOSE 3000

# Labels for Home Assistant
LABEL \
    io.hass.name="Freebox Dashboard" \
    io.hass.description="Interface web moderne pour gérer votre Freebox" \
    io.hass.arch="aarch64|amd64|armv7" \
    io.hass.type="addon" \
    io.hass.version="1.0.4" \
    maintainer="Wrapper by Julien <https://github.com/julienortscheid>"
