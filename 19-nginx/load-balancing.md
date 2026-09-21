# Nginx Load Balancing

Nginx can distribute requests across multiple application servers.

## Round Robin

Default behavior:

upstream backend {
    server app1:80;
    server app2:80;
}

Requests are distributed between available servers.

## Least Connections

upstream backend {
    least_conn;

    server app1:80;
    server app2:80;
}

Traffic is sent to the server with fewer active connections.

## IP Hash

upstream backend {
    ip_hash;

    server app1:80;
    server app2:80;
}

Requests from the same client IP are generally routed to the same backend.

## Backend Failure

Open-source Nginx can perform passive failure handling.

Example:

upstream backend {
    server app1:80 max_fails=3 fail_timeout=30s;
    server app2:80 max_fails=3 fail_timeout=30s;
}
