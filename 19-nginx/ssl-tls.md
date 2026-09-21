# SSL/TLS with Nginx

Nginx is frequently used for TLS termination.

Architecture:

Client
  |
 HTTPS
  |
  v
Nginx
  |
 HTTP/HTTPS
  |
  v
Application

Example structure:

server {
    listen 443 ssl;
    server_name example.com;

    ssl_certificate /path/to/certificate.pem;
    ssl_certificate_key /path/to/private-key.pem;

    location / {
        proxy_pass http://backend;
    }
}

Never commit private keys, certificates containing sensitive material, or secrets to Git.

Production certificate management is commonly automated using certificate management platforms or ACME-based tooling.
