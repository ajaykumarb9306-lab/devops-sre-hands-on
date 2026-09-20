# GCP Compute Engine Web Server Project

Practical architecture for hosting an Nginx web server on Compute Engine.

## Architecture

Internet
   |
External IP / Load Balancer
   |
VPC Firewall
   |
Compute Engine
   |
Nginx

Monitoring:

Compute Engine -> Cloud Monitoring

Logs:

Application -> Cloud Logging

## Components

- GCP project
- VPC
- Subnet
- Firewall rule
- Compute Engine VM
- Service account
- Cloud Monitoring
- Cloud Logging

## Startup Script Example

#!/bin/bash
apt-get update
apt-get install -y nginx
systemctl enable nginx
systemctl start nginx

## Validation

curl http://SERVER_IP

## Troubleshooting

Check:

1. VM status
2. Firewall rules
3. VPC and subnet
4. Routes
5. External/internal IP
6. Nginx service
7. Listening ports
8. Logs

Linux commands:

systemctl status nginx
ss -tulpn
curl localhost
journalctl -u nginx
