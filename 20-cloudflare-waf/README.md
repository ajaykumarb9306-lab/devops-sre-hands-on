# Cloudflare & WAF

Cloudflare commonly sits between users and the origin application.

## Architecture

User
  |
  v
Cloudflare
  |
  +-- DNS
  +-- CDN / Cache
  +-- WAF
  +-- DDoS Protection
  +-- Bot Protection
  +-- TLS
  |
  v
Origin / Load Balancer
  |
  v
Application

## WAF

A Web Application Firewall inspects HTTP/HTTPS traffic and can block malicious or unwanted requests.

Common protections include:

- SQL injection
- Cross-site scripting (XSS)
- Malicious bots
- Suspicious IP addresses
- Geographic restrictions
- Rate-based attacks
- Known application vulnerabilities

## SRE Responsibilities

Typical operational work includes:

- Investigating blocked requests
- Troubleshooting 403 errors
- Reviewing security events
- Managing allow/block rules
- Checking DNS and proxy status
- TLS troubleshooting
- Protecting origin servers
- Identifying false positives
- Coordinating WAF changes with security teams
