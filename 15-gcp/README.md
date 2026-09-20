# Google Cloud Platform Hands-On

Practical GCP reference for DevOps, SRE, cloud operations, and FinOps.

## Core Areas

- gcloud CLI
- Projects
- IAM
- Compute Engine
- VPC networking
- Firewall rules
- Cloud Storage
- Cloud Logging
- Cloud Monitoring
- Billing and FinOps
- Troubleshooting

## Typical Architecture

Internet
   |
Cloud Load Balancing
   |
VPC / Firewall
   |
Compute Engine / GKE
   |
Application

Supporting services:

Cloud Monitoring -> Metrics and Alerts
Cloud Logging    -> Logs
IAM              -> Access Control
Cloud Storage    -> Object Storage
Cloud Billing    -> Cost Management

## CLI

gcloud version
gcloud auth list
gcloud config list
gcloud projects list

## Security

Never commit:

- Service account keys
- Access tokens
- Application credentials
- Private keys
