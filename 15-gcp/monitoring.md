# GCP Monitoring and Logging

## Cloud Monitoring

Cloud Monitoring provides:

- Metrics
- Dashboards
- Alerting
- Uptime monitoring

## Cloud Logging

Cloud Logging centralizes logs from Google Cloud resources and applications.

## Useful Commands

List logs:

gcloud logging logs list

Read errors:

gcloud logging read \
  'severity>=ERROR' \
  --limit=20

## SRE Investigation

Alert
  |
Metric
  |
Logs
  |
Affected Resource
  |
Dependencies
  |
Root Cause
  |
Recovery

## Common Signals

- CPU utilization
- Memory utilization
- Disk utilization
- Request latency
- Error rate
- Availability
- Network traffic
