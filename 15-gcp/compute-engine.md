# Compute Engine

Compute Engine provides virtual machines in Google Cloud.

## Core Components

VM Instance
Machine Type
Boot Disk
Image
VPC
Subnet
Firewall Rule
Service Account
Metadata

## List Instances

gcloud compute instances list

## Describe Instance

gcloud compute instances describe INSTANCE_NAME \
  --zone=ZONE

## SSH

gcloud compute ssh INSTANCE_NAME \
  --zone=ZONE

## Troubleshooting Flow

VM
 |
Instance State
 |
Network Interface
 |
Firewall Rule
 |
Route
 |
Operating System
 |
Application

## Linux Checks

uptime
df -h
free -m
ps aux
ss -tulpn
systemctl --failed
journalctl -xe

## Common Problems

- VM stopped
- Disk full
- High CPU
- Memory exhaustion
- Firewall rule missing
- Application service stopped
- Incorrect service account permissions
- Network route problems
