# Nginx Commands

## Version

nginx -v

## Test Configuration

nginx -t

## Reload Configuration

nginx -s reload

Linux systemd environments:

sudo systemctl reload nginx

## Service Status

sudo systemctl status nginx

## Start / Stop / Restart

sudo systemctl start nginx
sudo systemctl stop nginx
sudo systemctl restart nginx

## Logs

tail -f /var/log/nginx/access.log

tail -f /var/log/nginx/error.log

## HTTP Testing

curl http://localhost

curl -I http://localhost

curl -v http://localhost

## Ports

ss -lntp

Linux alternative:

netstat -lntp

macOS:

lsof -iTCP -sTCP:LISTEN

## Docker

docker ps

docker logs CONTAINER_NAME

docker exec CONTAINER_NAME nginx -t

docker exec CONTAINER_NAME nginx -T
