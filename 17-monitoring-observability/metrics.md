# Metrics

Metrics are numerical measurements collected over time.

## Infrastructure Metrics

CPU
Memory
Disk
Network
Load
Filesystem usage

## Application Metrics

Request count
Response time
Error rate
Active users
Queue depth
Database connections

## Metric Types

Counter
Gauge
Histogram
Summary

## Counter

Only increases.

Example:

http_requests_total

## Gauge

Can increase or decrease.

Example:

memory_usage_bytes

## Histogram

Groups observations into buckets.

Useful for:

Request latency
Response size

## Important SRE Metrics

Availability
Latency
Error rate
Throughput
Resource saturation
