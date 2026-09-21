# WAF Security Lab

This lab simulates basic edge-security behavior using Nginx.

It is not a replacement for a full Cloudflare WAF.

## Architecture

Client
  |
  v
Security Proxy
  |
  +-- Security Headers
  +-- Admin Block
  +-- Rate Limiting
  |
  v
Origin Application

## Start

docker compose up -d

## Normal Request

curl -i http://localhost:8081/

Expected:

HTTP 200

## Blocked Path

curl -i http://localhost:8081/admin

Expected:

HTTP 403

## Security Headers

curl -I http://localhost:8081/

Look for:

X-Content-Type-Options
X-Frame-Options
Referrer-Policy

## Rate Limit Test

for i in {1..15}; do
  curl -s -o /dev/null -w "%{http_code}\n" http://localhost:8081/api/
done

Rapid requests should eventually be rate limited.

## Logs

docker compose logs waf

## Stop

docker compose down
