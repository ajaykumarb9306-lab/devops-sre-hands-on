# Nginx Reverse Proxy

A reverse proxy receives client requests and forwards them to backend applications.

Client
  |
  v
Nginx
  |
  v
Application

Example:

server {
    listen 80;

    location / {
        proxy_pass http://app:8080;

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}

## Why Reverse Proxies Are Used

- Hide backend servers
- Centralize client access
- TLS termination
- Routing
- Load balancing
- Logging
- Security controls
- Caching
