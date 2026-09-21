# Nginx Configuration

Common Linux configuration location:

/etc/nginx/nginx.conf

Additional configuration is often stored under:

/etc/nginx/conf.d/

## Basic Server

server {
    listen 80;
    server_name example.com;

    location / {
        root /usr/share/nginx/html;
        index index.html;
    }
}

## Important Directives

listen
    Defines the listening port.

server_name
    Defines the hostname handled by the server block.

location
    Defines how requests for specific URI paths are processed.

proxy_pass
    Sends requests to another server.

access_log
    Defines request logging.

error_log
    Defines error logging.

upstream
    Defines a group of backend servers.

## Configuration Validation

Always validate configuration before reload:

nginx -t

A bad configuration can prevent Nginx from reloading or starting.
