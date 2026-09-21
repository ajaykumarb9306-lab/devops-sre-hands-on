# Nginx

Nginx is commonly used as:

- Web server
- Reverse proxy
- Load balancer
- TLS termination point
- API gateway/proxy layer
- Static content server

## Typical Architecture

Client
  |
  v
Nginx
  |
  +----> Application Server 1
  |
  +----> Application Server 2

Nginx can distribute traffic across multiple backend servers and provide a single entry point for applications.

## This Module

This module covers:

- Core Nginx concepts
- Configuration
- Reverse proxy
- Load balancing
- Logging
- Useful commands
- Troubleshooting
- Docker-based load-balancer project
