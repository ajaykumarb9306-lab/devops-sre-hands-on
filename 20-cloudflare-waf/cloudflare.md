# Cloudflare

## DNS

Cloudflare can provide authoritative DNS for a domain.

Example:

app.example.com
      |
      v
Cloudflare
      |
      v
Origin

## Proxied Records

When Cloudflare proxying is enabled, clients connect to Cloudflare rather than directly to the origin.

This enables services such as:

- CDN
- WAF
- DDoS protection
- TLS
- Bot protection
- Security rules

## CDN

Cloudflare can cache content closer to users.

Benefits:

- Lower latency
- Reduced origin traffic
- Improved availability

## Security Events

Security events help investigate requests that were:

- Blocked
- Challenged
- Allowed
- Matched by security rules

Useful investigation fields can include:

- Source IP
- Country
- Host
- URI
- HTTP method
- User agent
- Rule
- Action
