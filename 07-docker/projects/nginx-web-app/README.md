# Nginx Docker Web App

A simple hands-on Docker project that builds a custom Nginx image and serves a static HTML page.

## Architecture

User → EC2 Port 8080 → Docker Container Port 80 → Nginx → index.html

## Build the Image

```bash
docker build -t ajaykumar9306/my-first-docker-image:latest .
```

## View Images

```bash
docker images
```

## Run the Container

```bash
docker run -d \
  -p 8080:80 \
  --name my-first-container \
  ajaykumar9306/my-first-docker-image:latest
```

## Verify Container

```bash
docker ps
```

## Test the Application

```bash
curl localhost:8080
```

## View Container Logs

```bash
docker logs my-first-container
```

## Stop the Container

```bash
docker stop my-first-container
```

## Start It Again

```bash
docker start my-first-container
```

## Remove the Container

```bash
docker rm -f my-first-container
```

## Push Image to Docker Hub

```bash
docker login
docker push ajaykumar9306/my-first-docker-image:latest
```