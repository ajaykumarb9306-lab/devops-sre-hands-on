# TLS

Cloudflare can terminate TLS connections from clients and establish a separate connection to the origin.

Client
   |
 HTTPS
   |
Cloudflare
   |
 HTTPS
   |
Origin

## Troubleshooting

Check:

- Certificate validity
- Hostname
- Expiration
- TLS mode
- Origin certificate
- DNS
- Origin availability

Useful command:

curl -Iv https://example.com

OpenSSL:

openssl s_client -connect example.com:443 -servername example.com
