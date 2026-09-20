# GCP Networking

## VPC

A VPC provides networking for Google Cloud resources.

## Subnets

GCP VPC networks are global while subnets are regional.

## Firewall Rules

Firewall rules control traffic to and from workloads.

Inspect:

gcloud compute firewall-rules list

## Routes

Inspect:

gcloud compute routes list

## Network Troubleshooting

Client
  |
DNS
  |
Load Balancer
  |
Firewall
  |
VPC Route
  |
VM Network Interface
  |
Operating System Firewall
  |
Application Port

Useful commands:

gcloud compute networks list
gcloud compute networks subnets list
gcloud compute routes list
gcloud compute firewall-rules list
gcloud compute instances list
