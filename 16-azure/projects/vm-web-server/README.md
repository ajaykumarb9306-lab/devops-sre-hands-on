# Azure VM Web Server Project

Reference architecture for hosting an Nginx application on an Azure Linux VM.

## Architecture

Internet
   |
Public IP / Load Balancer
   |
Network Security Group
   |
Virtual Network
   |
Subnet
   |
Network Interface
   |
Linux Virtual Machine
   |
Nginx

Observability:

VM -> Azure Monitor -> Alerts

Logs:

VM / Application -> Log Analytics

## Components

- Subscription
- Resource Group
- Virtual Network
- Subnet
- Network Security Group
- Network Interface
- Linux Virtual Machine
- Managed Disk
- Managed Identity
- Azure Monitor

## Cloud-Init Example

#!/bin/bash

apt-get update
apt-get install -y nginx
systemctl enable nginx
systemctl start nginx

## Application Validation

From the VM:

curl localhost

From an authorized client:

curl http://SERVER_IP

## Troubleshooting

Check:

1. VM power state
2. Public/private IP
3. NIC
4. NSG rules
5. Route
6. OS firewall
7. Nginx process
8. Listening port
9. Azure Monitor
10. Application logs

Linux commands:

systemctl status nginx
ss -tulpn
curl localhost
journalctl -u nginx
