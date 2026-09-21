# HTTP Troubleshooting

## 400

Bad Request

Investigate request format and client input.

## 401

Unauthorized

Investigate authentication.

## 403

Forbidden

Investigate authorization, WAF, proxy rules, and application access policies.

## 404

Not Found

Investigate routing, URL, proxy paths, and application routes.

## 429

Too Many Requests

Investigate rate limiting and traffic volume.

## 500

Internal Server Error

Investigate application logs.

## 502

Bad Gateway

Proxy/load balancer cannot successfully communicate with the backend.

Check:

- Backend process
- Backend hostname
- Backend port
- DNS
- Network
- Proxy configuration

## 503

Service Unavailable

Check:

- Application availability
- Capacity
- Maintenance
- Rate limiting
- Healthy backend count

## 504

Gateway Timeout

Check:

- Slow application
- Database latency
- Dependency latency
- Network latency
- Timeout configuration
