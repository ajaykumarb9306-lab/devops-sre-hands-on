# AWS Monitoring

CloudWatch provides AWS monitoring, metrics, logs, dashboards, and alarms.

## Metrics

Examples:

EC2 CPUUtilization
Load Balancer request metrics
RDS metrics

## Alarms

List alarms:

aws cloudwatch describe-alarms

Typical alarms:

- High CPU
- Application errors
- Unhealthy targets
- Disk or memory metrics through CloudWatch Agent
- Database resource pressure

## Logs

List log groups:

aws logs describe-log-groups

## Systems Manager

Systems Manager can provide operational access and automation without directly exposing SSH.

Check managed instances:

aws ssm describe-instance-information

## SRE Monitoring Flow

Alert
  |
Metric / Log
  |
Affected Resource
  |
Dependency
  |
Root Cause
  |
Recovery
