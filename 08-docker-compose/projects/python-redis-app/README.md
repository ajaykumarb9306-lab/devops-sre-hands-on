# Python + Redis Docker Compose Project

Multi-container application demonstrating Docker Compose networking, health checks, environment variables, dependencies, and persistent volumes.

## Architecture

```text
Browser
   │
   │ localhost:5000
   ↓
Python / Flask Container
   │
   │ redis:6379
   ↓
Redis Container
   │
   ↓
redis-data Volume
```

## Services

### app

Python Flask application listening on:

```text
5000
```

Host mapping:

```text
localhost:5000 → app:5000
```

### redis

Redis runs internally on:

```text
6379
```

Redis does not need to expose port 6379 to the host because the application communicates with it through the Docker Compose network.

## Start

```bash
docker compose up -d --build
```

## Check Containers

```bash
docker compose ps
```

## Test Application

```bash
curl localhost:5000
```

Refresh multiple times:

```bash
curl localhost:5000
curl localhost:5000
curl localhost:5000
```

The visit counter should increase.

## Health Endpoint

```bash
curl localhost:5000/health
```

Expected:

```json
{"status":"healthy"}
```

## Logs

All services:

```bash
docker compose logs
```

Application:

```bash
docker compose logs app
```

Redis:

```bash
docker compose logs redis
```

Follow:

```bash
docker compose logs -f
```

## Container Communication

Enter the application container:

```bash
docker compose exec app sh
```

The Redis hostname is:

```text
redis
```

Docker Compose provides service discovery through its internal network.

## Redis Test

```bash
docker compose exec redis redis-cli ping
```

Expected:

```text
PONG
```

View counter:

```bash
docker compose exec redis redis-cli GET visits
```

## Restart Application

```bash
docker compose restart app
```

The counter remains because Redis stores the value.

## Stop Containers

```bash
docker compose down
```

Start again:

```bash
docker compose up -d
```

The Redis data should remain because the named volume still exists.

## Delete Containers and Volume

```bash
docker compose down -v
```

This removes the persistent Redis volume and its stored data.