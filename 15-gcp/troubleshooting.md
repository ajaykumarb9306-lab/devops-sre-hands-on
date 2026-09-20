# GCP Troubleshooting

## Authentication

Check:

gcloud auth list
gcloud config list

Common problems:

- No authenticated account
- Wrong account
- Wrong project
- Missing IAM permissions

## Compute Instance Unreachable

Check:

gcloud compute instances list
gcloud compute firewall-rules list
gcloud compute routes list

Then inspect:

- VM state
- Network interface
- Firewall
- Routes
- OS firewall
- Application

## Permission Denied

Check:

gcloud auth list
gcloud config get-value project

Then review:

- IAM role
- Service account
- Organization policy
- API enablement
- Resource-level permissions

## Application Failure

Investigation flow:

Load Balancer
  |
Backend Health
  |
Firewall
  |
VM / GKE
  |
Application Process
  |
Logs

## Logging

Search recent errors:

gcloud logging read \
  'severity>=ERROR' \
  --limit=20

## General SRE Flow

Identify symptom
  |
Identify affected resource
  |
Check metrics
  |
Check logs
  |
Check IAM
  |
Check network
  |
Check infrastructure
  |
Check application
  |
Recover
  |
Document root cause
