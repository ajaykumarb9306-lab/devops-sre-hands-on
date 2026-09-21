# GitOps Web Application

This project demonstrates GitOps deployment using GitHub, Argo CD, and Kubernetes.

## Flow

GitHub
   |
Argo CD
   |
Kubernetes
   |
Nginx Deployment
   |
Service

## Desired State

The manifests directory contains the desired Kubernetes configuration.

Argo CD monitors:

18-gitops/projects/gitops-web-app/manifests

## Automated Sync

The Application enables:

- Automated synchronization
- Pruning
- Self-healing

## Drift Example

If Git specifies three replicas but the live deployment is manually changed, Argo CD can detect and reconcile the difference.

## Verification

kubectl get deployment gitops-web-app
kubectl get pods -l app=gitops-web-app
kubectl get service gitops-web-app

## Application Test

kubectl port-forward service/gitops-web-app 8080:80

Then:

curl localhost:8080

Stop port-forwarding with Control+C.
