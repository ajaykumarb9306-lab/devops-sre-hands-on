# Broken Service Incident Lab

This project intentionally contains a production-style failure.

## Architecture

Client
  |
  v
Nginx Proxy
  |
  v
Application

The initial proxy configuration is intentionally incorrect.

## Incident

Users report that:

http://localhost:8082

returns:

502 Bad Gateway

## Troubleshooting Goal

Do not immediately restart everything.

Investigate:

1. Client response
2. Container status
3. Proxy logs
4. Backend connectivity
5. Backend port
6. Proxy configuration

Identify the root cause and restore service.

## Useful Commands

curl -i http://localhost:8082

docker compose ps

docker compose logs proxy

docker exec incident-proxy wget -qO- http://app

docker exec incident-proxy wget -qO- http://app:8080

docker exec incident-proxy nginx -T

## Expected Root Cause

The backend application listens on port 80.

The proxy is intentionally configured to connect to port 8080.

## Recovery

Change:

proxy_pass http://app:8080;

to:

proxy_pass http://app:80;

Validate and reload/restart the proxy.

## Verification

curl -i http://localhost:8082

Expected:

HTTP 200

Application is healthy.
