# Nginx Load Balancer Project

This project demonstrates Nginx operating as a reverse proxy and load balancer.

## Architecture

             Client
               |
               v
        Nginx Load Balancer
             :8080
             /   \
            /     \
           v       v
        APP1      APP2
         :80       :80

All components run as Docker containers.

## Start

docker compose up -d

## Verify

docker compose ps

curl http://localhost:8080

Run multiple requests:

for i in {1..6}; do
  curl -s http://localhost:8080 | grep "Request handled"
done

Expected responses should alternate between APP1 and APP2 because Nginx uses round-robin load balancing by default.

## Validate Nginx

docker exec nginx-lb nginx -t

## Logs

docker compose logs nginx

## Stop

docker compose down
