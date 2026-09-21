# Monitoring and Observability

Practical SRE reference for understanding system health, detecting failures, troubleshooting incidents, and measuring reliability.

## Observability Pillars

Metrics
Logs
Traces

Together they help answer:

- What is failing?
- When did it start?
- Which users are affected?
- Which service caused it?
- Why did it happen?

## SRE Monitoring Flow

User Impact
    |
Alert
    |
Metrics
    |
Logs
    |
Traces
    |
Infrastructure + Application
    |
Root Cause
    |
Recovery

## Tools Covered

- Prometheus
- Grafana
- New Relic
- Docker monitoring
- Kubernetes monitoring
- Alerting
- SLI / SLO / SLA

## Golden Signals

Latency
Traffic
Errors
Saturation
