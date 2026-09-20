# Docker Compose Commands

## Check Version

```bash
docker compose version
```

Modern Docker installations use:

```bash
docker compose
```

rather than the older:

```bash
docker-compose
```

---

## Start Application

Foreground:

```bash
docker compose up
```

Background:

```bash
docker compose up -d
```

---

## View Containers

```bash
docker compose ps
```

All containers:

```bash
docker compose ps -a
```

---

## Logs

All services:

```bash
docker compose logs
```

Follow:

```bash
docker compose logs -f
```

Specific service:

```bash
docker compose logs web
```

Last 100 lines:

```bash
docker compose logs --tail 100
```

---

## Stop Services

```bash
docker compose stop
```

Start again:

```bash
docker compose start
```

Restart:

```bash
docker compose restart
```

Specific service:

```bash
docker compose restart web
```

---

## Remove Application

```bash
docker compose down
```

Remove containers and volumes:

```bash
docker compose down -v
```

Be careful with `-v` because persistent data may be deleted.

---

## Build Images

```bash
docker compose build
```

Rebuild without cache:

```bash
docker compose build --no-cache
```

Build and start:

```bash
docker compose up -d --build
```

---

## Execute Commands

Open shell:

```bash
docker compose exec web sh
```

Run command:

```bash
docker compose exec web nginx -v
```

---

## View Configuration

Validate and render the Compose configuration:

```bash
docker compose config
```

This is useful for detecting YAML/configuration problems.

---

## Pull Images

```bash
docker compose pull
```

---

## View Images

```bash
docker compose images
```

---

## View Processes

```bash
docker compose top
```

---

## Scale a Service

Example:

```bash
docker compose up -d --scale worker=3
```

This is useful for services that can safely run multiple replicas.

---

## Docker Resources

Networks:

```bash
docker network ls
```

Volumes:

```bash
docker volume ls
```

Containers:

```bash
docker ps
```

---

## Typical Workflow

```bash
docker compose config

docker compose up -d

docker compose ps

docker compose logs

curl localhost:8080

docker compose down
```