# Docker

Hands-on Docker notes, commands, troubleshooting scenarios, and projects.

## Topics

- Docker images and containers
- Dockerfiles
- Image build process
- Container lifecycle
- Port mapping
- Environment variables
- Volumes and persistent storage
- Bind mounts
- Docker networking
- Logs and troubleshooting
- Resource limits
- Docker Hub
- Container cleanup

## Repository Structure

```text
07-docker/
├── README.md
├── commands.md
├── troubleshooting.md
└── projects/
    └── nginx-web-app/
        ├── Dockerfile
        ├── index.html
        └── README.md
```

## Hands-On Projects

### Nginx Web Application

Build a custom Nginx Docker image and run the application inside a container.

[View Project](projects/nginx-web-app/)

## Quick Troubleshooting

```bash
docker ps -a
docker logs <container>
docker inspect <container>
docker stats
docker exec -it <container> /bin/sh
```

See [Docker Troubleshooting](troubleshooting.md) for documented issues and fixes.