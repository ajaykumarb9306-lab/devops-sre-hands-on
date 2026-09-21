# Monitoring and Observability Troubleshooting

## Service Is Slow

Check:

1. Latency
2. Request volume
3. Error rate
4. CPU
5. Memory
6. Database latency
7. External dependencies
8. Recent deployments

## High CPU

Check:

top
ps aux
docker stats
kubectl top pods

Then correlate CPU with:

Traffic
Deployments
Errors
Application transactions

## Memory Problems

Look for:

Memory growth
OOMKilled containers
Swap activity
Memory limits
Leaks

## Disk Problems

Check:

df -h
du -sh *
docker system df

## Prometheus Target Down

Check:

Prometheus targets page
Network connectivity
Target port
/metrics endpoint
prometheus.yml
Container DNS

## Grafana Has No Data

Check:

Data source
Prometheus health
Query
Time range
Network connectivity

## SRE Incident Flow

Detect
 |
Validate
 |
Determine blast radius
 |
Inspect metrics
 |
Inspect logs
 |
Inspect traces
 |
Check recent changes
 |
Mitigate
 |
Recover
 |
Root-cause analysis
