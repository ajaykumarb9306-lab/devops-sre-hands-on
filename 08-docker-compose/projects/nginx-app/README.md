# Nginx Docker Compose Project

Simple hands-on project demonstrating Docker Compose.

## Architecture

```text
Browser
   │
   │ Port 8080
   ↓
Docker Host
   │
   ↓
Nginx Container
Port 80
   │
   ↓
index.html
```

Port mapping:

```text
Host 8080 → Container 80
```

## Start

From this directory:

```bash
docker compose up -d
```

## Check

```bash
docker compose ps
```

## Test

```bash
curl localhost:8080
```

Or open:

```text
http://localhost:8080
```

## Logs

```bash
docker compose logs -f web
```

## Enter Container

```bash
docker compose exec web sh
```

Inside the container:

```bash
nginx -v
```

Exit:

```bash
exit
```

## Stop

```bash
docker compose down
```

## Useful Troubleshooting

Validate YAML:

```bash
docker compose config
```

Check containers:

```bash
docker compose ps -a
```

Check logs:

```bash
docker compose logs web
```

Check port:

```bash
docker ps
```

Test application:

```bash
curl localhost:8080
```