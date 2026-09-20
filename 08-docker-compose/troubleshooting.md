# Docker Compose Troubleshooting

## Validate Compose File

Always start with:

```bash
docker compose config
```

This catches many YAML and configuration errors.

---

## Container Not Running

```bash
docker compose ps -a
```

Then:

```bash
docker compose logs <service>
```

Example:

```bash
docker compose logs app
```

---

## Application Cannot Connect to Redis

Check containers:

```bash
docker compose ps
```

Check Redis:

```bash
docker compose exec redis redis-cli ping
```

Expected:

```text
PONG
```

Check application environment:

```bash
docker compose exec app env | grep REDIS
```

Expected:

```text
REDIS_HOST=redis
```

Check logs:

```bash
docker compose logs app
docker compose logs redis
```

Remember that containers should normally communicate using the Compose service name:

```text
redis
```

not:

```text
localhost
```

Inside the app container, `localhost` refers to the app container itself.

---

## Port Already in Use

Example:

```text
Bind for 0.0.0.0:5000 failed:
port is already allocated
```

Check:

```bash
docker ps
```

macOS/Linux:

```bash
lsof -i :5000
```

Either stop the conflicting process or change the host mapping:

```yaml
ports:
  - "5001:5000"
```

Then access:

```text
http://localhost:5001
```

---

## Image Build Failure

Rebuild:

```bash
docker compose build
```

Without cache:

```bash
docker compose build --no-cache
```

Check:

```text
Dockerfile
requirements.txt
Build context
File paths
```

---

## Service Name Resolution

Containers on the Compose network can reach services using service names.

Example:

```text
app → redis:6379
```

Inspect networks:

```bash
docker network ls
```

Inspect a network:

```bash
docker network inspect <network>
```

---

## Health Check Failure

Check:

```bash
docker compose ps
```

Inspect Redis:

```bash
docker compose exec redis redis-cli ping
```

Check logs:

```bash
docker compose logs redis
```

---

## Volume Troubleshooting

List:

```bash
docker volume ls
```

Inspect:

```bash
docker volume inspect <volume>
```

Remember:

```bash
docker compose down
```

normally preserves named volumes.

But:

```bash
docker compose down -v
```

removes them.

---

## General Troubleshooting Flow

```text
Validate YAML
     ↓
docker compose config
     ↓
Check containers
     ↓
docker compose ps -a
     ↓
Check logs
     ↓
docker compose logs
     ↓
Check ports
     ↓
Check environment
     ↓
Check service DNS/network
     ↓
Check health checks
     ↓
Check volumes
```