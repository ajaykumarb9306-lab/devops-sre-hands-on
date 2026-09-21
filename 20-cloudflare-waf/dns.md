# DNS Troubleshooting

## Useful Commands

dig example.com

nslookup example.com

dig +short example.com

## Investigation Flow

User reports application unavailable.

Check:

DNS Resolution
      |
Cloudflare Proxy
      |
TLS
      |
WAF / Security Rules
      |
Origin Connectivity
      |
Application

## Common Problems

- Incorrect DNS record
- Wrong origin address
- DNS record not proxied as expected
- Stale DNS/cache assumptions
- Origin unavailable
- TLS configuration problems
