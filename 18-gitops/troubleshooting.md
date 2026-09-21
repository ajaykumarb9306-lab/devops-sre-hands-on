# GitOps Troubleshooting

## Application OutOfSync

Check:

argocd app get APP_NAME

Investigate:

- Git changes
- Manual Kubernetes changes
- Invalid manifests
- Resource differences

## Application Degraded

Check Kubernetes:

kubectl get pods
kubectl describe pod POD_NAME
kubectl logs POD_NAME

Common causes:

- ImagePullBackOff
- CrashLoopBackOff
- Failed probes
- Missing ConfigMap
- Missing Secret
- Resource limits

## Repository Problems

Check:

- Repository URL
- Branch
- Manifest path
- Authentication
- Network connectivity

## Argo CD Problems

kubectl get pods -n argocd

kubectl logs -n argocd \
  deployment/argocd-server

## GitOps Incident Flow

Alert
  |
Check Argo CD application
  |
Compare Git vs live state
  |
Check Kubernetes resources
  |
Check events and logs
  |
Identify recent Git changes
  |
Recover or revert
