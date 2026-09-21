# Alerting

Alerts should identify conditions requiring human attention.

## Good Alerts

Actionable
Relevant
Clear
Low-noise
Linked to user or service impact

## Poor Alerting

CPU > 70% for a few seconds

This may create noise without identifying actual impact.

## Better Alerting

Sustained high resource usage combined with:

High latency
High error rate
Capacity risk
Service degradation

## Severity Example

Critical

Immediate service impact.

Warning

Potential degradation requiring investigation.

Informational

Useful operational signal but usually not urgent.

## Alert Investigation

Alert
 |
Validate impact
 |
Check dashboard
 |
Check metrics
 |
Check logs
 |
Check dependencies
 |
Mitigate
 |
Root-cause analysis
