# SRE Incident Runbook

## Step 1 - Confirm Impact

Identify:

- Application
- Environment
- Users affected
- Error
- Start time

## Step 2 - Reproduce

Examples:

curl -v URL

Check monitoring dashboards and alerts.

## Step 3 - Follow Request Path

DNS
 |
WAF/CDN
 |
Load Balancer
 |
Proxy
 |
Application
 |
Database / Dependency

## Step 4 - Check Recent Changes

Look for:

- Deployments
- Configuration
- Infrastructure
- Network
- DNS
- Security rules

## Step 5 - Collect Evidence

Metrics
Logs
Traces
Events

## Step 6 - Mitigate

Examples:

- Roll back deployment
- Restart failed component when justified
- Remove bad configuration
- Fail over
- Scale capacity
- Restore dependency

## Step 7 - Verify

Confirm:

- HTTP response
- Error rate
- Latency
- Application health
- User functionality

## Step 8 - Document

Record:

- Impact
- Timeline
- Root cause
- Mitigation
- Corrective actions
