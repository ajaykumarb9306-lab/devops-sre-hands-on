# AWS EC2 Web Server Project

Practical architecture for deploying a Linux web server on AWS.

## Architecture

Internet
   |
Internet Gateway
   |
Public Subnet
   |
Security Group
   |
EC2
   |
Nginx

Monitoring:

EC2 -> CloudWatch

Management:

Administrator -> Systems Manager / controlled SSH access

## Components

- VPC
- Public subnet
- Route table
- Internet Gateway
- Security Group
- EC2 instance
- IAM role
- CloudWatch monitoring

## Security Group

Example inbound access:

HTTP  TCP 80  required client sources

SSH should be restricted to approved administrative sources if SSH is required.

## User Data Example

#!/bin/bash
apt-get update
apt-get install -y nginx
systemctl enable nginx
systemctl start nginx

## Validation

curl http://SERVER_IP

## Troubleshooting

Check:

1. EC2 instance state
2. EC2 status checks
3. Security Group
4. Route table
5. Internet Gateway
6. Network ACL
7. Nginx service
8. Port 80
9. Application logs

Useful Linux commands:

systemctl status nginx
ss -tulpn
curl localhost
journalctl -u nginx
