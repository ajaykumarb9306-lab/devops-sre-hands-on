# Logs

Logs provide detailed event information.

## Common Sources

Application logs
Operating system logs
Web server logs
Database logs
Container logs
Kubernetes logs
Cloud logs

## Linux

journalctl
journalctl -u SERVICE
journalctl -xe

## Docker

docker logs CONTAINER_NAME
docker logs -f CONTAINER_NAME
docker logs --tail 100 CONTAINER_NAME

## Kubernetes

kubectl logs POD_NAME
kubectl logs -f POD_NAME
kubectl logs POD_NAME --previous

## Useful Investigation Pattern

Error occurs
   |
Identify timestamp
   |
Identify affected service
   |
Search logs
   |
Correlate with metrics
   |
Check dependencies
   |
Determine root cause

## Good Logging Practices

Include:

Timestamp
Severity
Service
Request ID
Error message
Relevant context

Avoid logging passwords, tokens, secrets, or sensitive data.
