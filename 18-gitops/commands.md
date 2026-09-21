# GitOps and Argo CD Commands

## Argo CD CLI

argocd version --client

## Kubernetes

kubectl get namespaces
kubectl get pods -n argocd
kubectl get services -n argocd

## Applications

argocd app list
argocd app get APP_NAME
argocd app sync APP_NAME
argocd app history APP_NAME

## Kubernetes Resources

kubectl get deployments
kubectl get pods
kubectl get services

## Troubleshooting

kubectl describe pod POD_NAME
kubectl logs POD_NAME
kubectl get events --sort-by=.metadata.creationTimestamp

## Git

git status
git diff
git log --oneline
git revert COMMIT_ID
