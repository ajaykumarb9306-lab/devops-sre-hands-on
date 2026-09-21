# DDoS Protection and Rate Limiting

## DDoS

Distributed denial-of-service attacks attempt to overwhelm infrastructure or applications with traffic.

Cloudflare can absorb/filter traffic before it reaches the origin.

## Rate Limiting

Rate limiting controls how frequently requests are accepted.

Examples:

- Login endpoint protection
- API protection
- Expensive application endpoints
- Bot abuse reduction

Concept:

Client
  |
Many Requests
  |
Rate Limiter
  |
  +-- Allowed
  |
  +-- Rejected / Limited

HTTP 429 means:

Too Many Requests
