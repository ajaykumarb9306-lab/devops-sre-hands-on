# SRE Troubleshooting

This module provides practical troubleshooting workflows for production systems.

## Core Principle

Do not randomly restart services.

Follow the request path and collect evidence.

User
  |
  v
DNS
  |
  v
Load Balancer / Proxy
  |
  v
Application
  |
  v
Database / Dependencies

## Incident Workflow

Alert / User Report
       |
       v
Understand Impact
       |
       v
Check Recent Changes
       |
       v
Follow Request Path
       |
       v
Collect Metrics / Logs / Events
       |
       v
Form Hypothesis
       |
       v
Test Hypothesis
       |
       v
Mitigate / Recover
       |
       v
Verify
       |
       v
Document Root Cause

## Golden Signals

- Latency
- Traffic
- Errors
- Saturation

## Useful Evidence

- Metrics
- Logs
- Traces
- Events
- Deployment history
- Infrastructure changes
- Application changes
