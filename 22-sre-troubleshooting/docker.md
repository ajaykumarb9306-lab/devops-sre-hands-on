# Docker Troubleshooting

## Containers

docker ps

docker ps -a

## Logs

docker logs CONTAINER_NAME

docker logs --tail 100 CONTAINER_NAME

## Inspect

docker inspect CONTAINER_NAME

## Processes

docker top CONTAINER_NAME

## Resource Usage

docker stats

## Networking

docker network ls

docker network inspect NETWORK_NAME

## Test From Container

docker exec CONTAINER_NAME wget -qO- http://SERVICE

## Compose

docker compose ps

docker compose logs

docker compose config

## Common Problems

- Container exited
- Port conflict
- Incorrect environment variable
- DNS/service-name error
- Missing volume
- Bad configuration
- Image pull failure
