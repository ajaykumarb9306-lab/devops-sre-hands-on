# Docker Commands Cheat Sheet

Practical Docker commands for building, running, inspecting, troubleshooting, and managing containers and images.

## Docker Information

Check Docker version:

```bash
docker --version
```

Detailed Docker environment information:

```bash
docker info
```

## Docker Hub

Login:

```bash
docker login
```

Logout:

```bash
docker logout
```

Pull an image:

```bash
docker pull nginx:alpine
```

Push an image:

```bash
docker push username/image-name:tag
```

## Images

List local images:

```bash
docker images
```

Build an image using the Dockerfile in the current directory:

```bash
docker build -t my-image:latest .
```

Build without using cache:

```bash
docker build --no-cache -t my-image:latest .
```

Tag an image:

```bash
docker tag my-image:latest username/my-image:latest
```

Inspect an image:

```bash
docker inspect my-image:latest
```

View image history/layers:

```bash
docker history my-image:latest
```

Remove an image:

```bash
docker rmi my-image:latest
```

Remove unused images:

```bash
docker image prune
```

## Containers

Run a container:

```bash
docker run nginx
```

Run in detached mode:

```bash
docker run -d nginx
```

Run with a name:

```bash
docker run -d --name web nginx
```

Publish a port:

```bash
docker run -d -p 8080:80 --name web nginx
```

Port mapping format:

```text
HOST_PORT:CONTAINER_PORT
```

Example:

```text
8080:80
```

means:

```text
localhost:8080 → container:80
```

List running containers:

```bash
docker ps
```

List all containers:

```bash
docker ps -a
```

Stop a container:

```bash
docker stop web
```

Start an existing container:

```bash
docker start web
```

Restart a container:

```bash
docker restart web
```

Remove a stopped container:

```bash
docker rm web
```

Force-remove a running container:

```bash
docker rm -f web
```

## Logs and Troubleshooting

View logs:

```bash
docker logs web
```

Follow logs continuously:

```bash
docker logs -f web
```

Show recent logs:

```bash
docker logs --tail 100 web
```

Inspect container configuration:

```bash
docker inspect web
```

View container resource usage:

```bash
docker stats
```

View processes running inside a container:

```bash
docker top web
```

View container port mappings:

```bash
docker port web
```

## Execute Commands Inside a Container

Open a shell:

```bash
docker exec -it web /bin/sh
```

If Bash is available:

```bash
docker exec -it web /bin/bash
```

Run a single command:

```bash
docker exec web ls -la
```

Example:

```bash
docker exec web cat /usr/share/nginx/html/index.html
```

## Environment Variables

Pass an environment variable:

```bash
docker run -d \
  -e APP_ENV=production \
  my-image
```

View environment variables:

```bash
docker exec web env
```

## Volumes

List volumes:

```bash
docker volume ls
```

Create a volume:

```bash
docker volume create app-data
```

Inspect a volume:

```bash
docker volume inspect app-data
```

Mount a volume:

```bash
docker run -d \
  --name web \
  -v app-data:/data \
  nginx
```

Remove a volume:

```bash
docker volume rm app-data
```

## Bind Mounts

Mount a local directory into a container:

```bash
docker run -d \
  -p 8080:80 \
  -v "$(pwd)":/usr/share/nginx/html \
  nginx
```

## Networks

List Docker networks:

```bash
docker network ls
```

Create a network:

```bash
docker network create app-network
```

Inspect a network:

```bash
docker network inspect app-network
```

Run a container on a network:

```bash
docker run -d \
  --name web \
  --network app-network \
  nginx
```

Connect an existing container:

```bash
docker network connect app-network web
```

Disconnect it:

```bash
docker network disconnect app-network web
```

Remove a network:

```bash
docker network rm app-network
```

## Copy Files

Copy from host to container:

```bash
docker cp file.txt web:/tmp/file.txt
```

Copy from container to host:

```bash
docker cp web:/tmp/file.txt .
```

## Resource Limits

Limit memory:

```bash
docker run -d \
  --memory="512m" \
  nginx
```

Limit CPU:

```bash
docker run -d \
  --cpus="1.0" \
  nginx
```

## Cleanup

Remove stopped containers:

```bash
docker container prune
```

Remove unused images:

```bash
docker image prune
```

Remove unused networks:

```bash
docker network prune
```

Remove unused volumes:

```bash
docker volume prune
```

Clean unused Docker resources:

```bash
docker system prune
```

Check Docker disk usage:

```bash
docker system df
```

## Useful Troubleshooting Flow

When a container is not working:

```bash
docker ps -a
docker logs <container>
docker inspect <container>
docker port <container>
docker stats
docker exec -it <container> /bin/sh
```

For application connectivity:

```text
Client
  ↓
Host Port
  ↓
Docker Port Mapping
  ↓
Container Port
  ↓
Application Process
```