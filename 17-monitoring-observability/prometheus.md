# Prometheus

Prometheus is a monitoring and time-series metrics system.

## Architecture

Application / Exporter
       |
       | /metrics
       |
Prometheus
       |
Time-Series Database
       |
PromQL
       |
Grafana / Alerting

## Important Concepts

Target
Scrape
Metric
Label
Time series
PromQL

## Common Metrics

up
process_cpu_seconds_total
process_resident_memory_bytes
http_requests_total

## PromQL Examples

Check targets:

up

CPU rate example:

rate(process_cpu_seconds_total[5m])

Filter:

up{job="prometheus"}

## Configuration

Prometheus uses prometheus.yml to define scrape targets.

Example:

scrape_configs:
  - job_name: prometheus
    static_configs:
      - targets:
          - prometheus:9090
