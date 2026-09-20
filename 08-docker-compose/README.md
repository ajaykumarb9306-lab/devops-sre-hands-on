# Docker Compose

Hands-on Docker Compose examples for running and managing multi-container applications.

## Why Docker Compose?

Running a single container is simple:

```bash
docker run ...
```

Real applications often require multiple services:

```text
Web Server
Application
Database
Cache
Monitoring
```

Docker Compose allows these services to be defined in one YAML file.

## Architecture

```text
Docker Host
│
├── Container: Web
│
├── Container: Application
│
├── Container: Database
│
└── Container: Cache
│
└── Docker Network
```

## Compose File

Modern Docker Compose commonly uses:

```text
compose.yaml
```

Example:

```yaml
services:

  web:
    image: nginx:alpine

    ports:
      - "8080:80"
```

Start:

```bash
docker compose up -d
```

Check:

```bash
docker compose ps
```

Logs:

```bash
docker compose logs
```

Stop and remove:

```bash
docker compose down
```

## Topics

- Compose YAML
- Services
- Images
- Ports
- Networks
- Volumes
- Environment variables
- Dependencies
- Health checks
- Logs
- Scaling
- Troubleshooting
- Multi-container applications

## Project

The project in this module demonstrates how Docker Compose manages an Nginx container and prepares the foundation for larger multi-service applications.