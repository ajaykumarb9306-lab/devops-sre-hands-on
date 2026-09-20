# Kubernetes Troubleshooting

## General Troubleshooting Flow

Application
  |
Ingress / Load Balancer
  |
Service
  |
EndpointSlice
  |
Pod
  |
Container
  |
Node / Network / Storage

Start with:

kubectl get pods -A
kubectl get nodes
kubectl get events --sort-by=.metadata.creationTimestamp

## CrashLoopBackOff

Check:

kubectl describe pod POD_NAME
kubectl logs POD_NAME
kubectl logs POD_NAME --previous

Common causes:

- Application crash
- Invalid configuration
- Missing environment variables
- Missing Secrets
- Incorrect commands or arguments
- Dependency failures
- Probe failures

## ImagePullBackOff

Check:

kubectl describe pod POD_NAME

Common causes:

- Incorrect image name
- Incorrect image tag
- Private registry authentication failure
- Registry unavailable
- ImagePullSecret problems

## Pending Pods

Check:

kubectl describe pod POD_NAME
kubectl get nodes

Common causes:

- Insufficient CPU
- Insufficient memory
- PVC unavailable
- Scheduling constraints
- Taints
- Affinity rules

## OOMKilled

Check:

kubectl describe pod POD_NAME
kubectl logs POD_NAME --previous

Review container memory requests and limits.

## Service Not Reaching Pods

Check:

kubectl get services
kubectl describe service SERVICE_NAME
kubectl get pods --show-labels
kubectl get endpointslices

Common causes:

- Service selector does not match Pod labels
- Pods are not Ready
- Incorrect targetPort
- Application is not listening on expected port

## DNS Problems

Check CoreDNS:

kubectl get pods -n kube-system
kubectl get services -n kube-system
kubectl logs -n kube-system -l k8s-app=kube-dns

## Probe Failures

Check:

kubectl describe pod POD_NAME

Verify:

- Probe path
- Probe port
- Application startup time
- Timeout settings
- Initial delay

## Node Problems

Check:

kubectl get nodes
kubectl get nodes -o wide
kubectl describe node NODE_NAME

Look for:

- MemoryPressure
- DiskPressure
- PIDPressure
- NetworkUnavailable
- NotReady

## SRE Investigation Sequence

kubectl get pods -A
kubectl get pods -o wide
kubectl describe pod POD_NAME
kubectl logs POD_NAME
kubectl logs POD_NAME --previous
kubectl get events --sort-by=.metadata.creationTimestamp
kubectl get services
kubectl get endpointslices
kubectl get nodes
