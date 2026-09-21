# Nginx Troubleshooting

## Configuration Error

Test first:

nginx -t

Docker:

docker exec CONTAINER_NAME nginx -t

## 502 Bad Gateway

Usually means Nginx cannot successfully communicate with the upstream application.

Check:

docker logs CONTAINER_NAME

Then verify:

- Backend is running
- Correct hostname
- Correct port
- DNS resolution
- Network connectivity
- proxy_pass configuration

## 504 Gateway Timeout

Nginx reached the upstream path but did not receive a response within the configured timeout.

Investigate:

- Slow application
- Database latency
- Network latency
- Dependency problems
- Timeout configuration

## 404

Check:

- Requested path
- location blocks
- root configuration
- Application routing

## 403

Check:

- File permissions
- Directory permissions
- Nginx configuration
- Access rules

## Port Already Used

macOS:

lsof -i :8080

Docker:

docker ps

## Container Troubleshooting

docker compose ps

docker compose logs nginx

docker compose logs app1

docker compose logs app2

## Connectivity from Nginx Container

docker exec nginx-lb wget -qO- http://app1

docker exec nginx-lb wget -qO- http://app2

## SRE Flow

Client Error
    |
Check HTTP status
    |
Check Nginx logs
    |
Check upstream connectivity
    |
Check backend health
    |
Check network/DNS
    |
Check application logs
