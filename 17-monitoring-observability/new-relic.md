# New Relic

New Relic is an observability platform covering infrastructure, applications, logs, metrics, traces, and alerting.

## Core Areas

Infrastructure Monitoring
APM
Logs
Distributed Tracing
Dashboards
Alerts
NRQL

## Typical Flow

Application
    |
New Relic Agent
    |
Telemetry
    |
New Relic
    |
Dashboards / Alerts / Investigation

## Infrastructure

Useful signals:

CPU
Memory
Disk
Network
Processes
Host availability

## APM

Useful signals:

Transactions
Response time
Throughput
Errors
Database calls
External services

## Logs

Correlate application and infrastructure events with incidents.

## Troubleshooting Flow

Alert
 |
Entity
 |
Golden Signals
 |
APM Transaction
 |
Logs
 |
Database / External Calls
 |
Infrastructure
 |
Root Cause

## NRQL Example Concepts

SELECT count(*)
FROM Transaction

SELECT average(duration)
FROM Transaction

SELECT percentage(count(*), WHERE error IS true)
FROM Transaction
