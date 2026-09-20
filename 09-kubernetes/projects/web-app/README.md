# Kubernetes Web Application

Hands-on Kubernetes application demonstrating a Deployment, Service, ConfigMap, health probes, resource management, scaling, and rolling updates.

## Architecture

Client
  |
Service
  |
Deployment
  |
ReplicaSet
  |
3 Nginx Pods

## Deploy

kubectl apply -f configmap.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

## Verify

kubectl get deployments
kubectl get pods
kubectl get services
kubectl get endpointslices

## Local Access

kubectl port-forward service/web-app-service 8080:80

Then access:

http://localhost:8080

## Scale

kubectl scale deployment web-app --replicas=5

## Rolling Update

kubectl set image deployment/web-app nginx=nginx:latest
kubectl rollout status deployment/web-app

## Rollback

kubectl rollout history deployment/web-app
kubectl rollout undo deployment/web-app

## Troubleshooting

kubectl get pods -o wide
kubectl describe deployment web-app
kubectl logs POD_NAME
kubectl get events --sort-by=.metadata.creationTimestamp
kubectl get services
kubectl get endpointslices
