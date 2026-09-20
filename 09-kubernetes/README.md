# Kubernetes Hands-On

Practical Kubernetes reference for DevOps and SRE work.

## Topics Covered

- Kubernetes architecture
- Pods
- Deployments and ReplicaSets
- Services
- Labels and selectors
- Namespaces
- ConfigMaps and Secrets
- Resource requests and limits
- Liveness, readiness, and startup probes
- Persistent storage
- Scaling
- Rolling updates and rollbacks
- Logs and events
- Kubernetes networking and DNS
- Troubleshooting

## Core Architecture

Client
  |
kubectl
  |
API Server
  |
Control Plane
  |
Scheduler / Controller Manager / etcd
  |
Nodes
  |
Pods
  |
Containers

## Common Workflow

Apply configuration:

```bash
kubectl apply -f deployment.yaml