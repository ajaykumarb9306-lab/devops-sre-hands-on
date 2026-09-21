# Azure Virtual Machines

Azure Virtual Machines provide Infrastructure-as-a-Service compute.

## Core Components

Virtual Machine
VM Size
Image
Managed Disk
Network Interface
Virtual Network
Subnet
Network Security Group
Public/Private IP
Managed Identity

## Commands

List:

az vm list --output table

Detailed list:

az vm list --show-details --output table

Inspect:

az vm show \
  --resource-group RESOURCE_GROUP \
  --name VM_NAME

## Linux VM Checks

uptime
df -h
free -m
ps aux
ss -tulpn
systemctl --failed
journalctl -xe

## Troubleshooting Flow

VM State
   |
NIC
   |
NSG
   |
Route
   |
Operating System
   |
Application Process
   |
Application Port

## Common Problems

- VM stopped or deallocated
- Disk full
- CPU saturation
- Memory pressure
- Incorrect NSG rule
- Application service stopped
- Route issue
- DNS issue
- Missing RBAC permission
