# Cloudflare and WAF Troubleshooting

## Application Unavailable

Check in this order:

1. DNS
2. Cloudflare proxy
3. TLS
4. WAF/security events
5. Origin connectivity
6. Load balancer
7. Application

## 403 Forbidden

Possible causes:

- WAF rule
- Custom security rule
- IP restriction
- Geographic restriction
- Application authorization
- Origin web server rule

## 429 Too Many Requests

Usually indicates rate limiting.

Investigate:

- Client IP
- Endpoint
- Request rate
- Bots/scripts
- Rate-limit policy

## 502 Bad Gateway

Investigate origin availability and connectivity.

Check:

- Origin server
- Load balancer
- Backend application
- Network/firewall
- DNS
- Proxy configuration

## 504 Gateway Timeout

Investigate:

- Slow application
- Database latency
- Dependency latency
- Origin overload
- Network problems

## False Positive Workflow

1. Reproduce the request.
2. Locate the security event.
3. Identify the exact rule.
4. Verify that the request is legitimate.
5. Create the narrowest possible exception.
6. Retest.
7. Monitor.
8. Document the change.
