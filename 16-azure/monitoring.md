# Azure Monitoring and Observability

## Azure Monitor

Azure Monitor collects and analyzes telemetry from Azure resources and applications.

## Core Areas

- Metrics
- Logs
- Alerts
- Dashboards
- Workbooks
- Application Insights
- Log Analytics

## Typical Flow

Azure Resource
     |
Metrics + Logs
     |
Azure Monitor
     |
Log Analytics
     |
Alert Rules
     |
Incident / SRE Response

## Common Signals

- CPU utilization
- Memory utilization
- Disk utilization
- Network traffic
- Availability
- Request latency
- Error rate
- Dependency failures

## Metrics

Example:

az monitor metrics list \
  --resource RESOURCE_ID \
  --metric Percentage CPU

## SRE Investigation

Alert
  |
Identify Resource
  |
Check Metrics
  |
Check Logs
  |
Check Dependencies
  |
Determine Root Cause
  |
Recover
  |
Document
