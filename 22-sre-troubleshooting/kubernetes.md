# Kubernetes Troubleshooting

## Start Here

kubectl get pods

kubectl get deployments

kubectl get services

## Pod Details

kubectl describe pod POD_NAME

## Logs

kubectl logs POD_NAME

kubectl logs POD_NAME --previous

## Events

kubectl get events --sort-by=.metadata.creationTimestamp

## Deployment

kubectl rollout status deployment/DEPLOYMENT_NAME

kubectl rollout history deployment/DEPLOYMENT_NAME

## Service

kubectl get endpoints SERVICE_NAME

## Common States

### CrashLoopBackOff

Check:

kubectl logs POD_NAME
kubectl logs POD_NAME --previous
kubectl describe pod POD_NAME

### ImagePullBackOff

Check:

- Image name
- Tag
- Registry
- Authentication

### Pending

Check:

- Resources
- Scheduling
- PVC
- Node availability

### Service Not Reachable

Check:

Service
   |
Endpoints
   |
Pod Labels
   |
Pod Readiness
   |
Application Port
