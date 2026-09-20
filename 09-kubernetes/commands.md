# Kubernetes Command Reference

## Cluster

kubectl cluster-info
kubectl config get-contexts
kubectl config current-context
kubectl get nodes
kubectl get nodes -o wide

## Pods

kubectl get pods
kubectl get pods -A
kubectl get pods -o wide
kubectl get pods --show-labels
kubectl describe pod POD_NAME
kubectl logs POD_NAME
kubectl logs -f POD_NAME
kubectl logs POD_NAME --previous
kubectl exec -it POD_NAME -- /bin/sh
kubectl delete pod POD_NAME

## Deployments

kubectl get deployments
kubectl describe deployment DEPLOYMENT_NAME
kubectl scale deployment DEPLOYMENT_NAME --replicas=5
kubectl rollout status deployment/DEPLOYMENT_NAME
kubectl rollout history deployment/DEPLOYMENT_NAME
kubectl rollout undo deployment/DEPLOYMENT_NAME

## Services

kubectl get services
kubectl describe service SERVICE_NAME
kubectl get endpointslices
kubectl port-forward service/SERVICE_NAME 8080:80

## Namespaces

kubectl get namespaces
kubectl get pods -n NAMESPACE
kubectl get all -n NAMESPACE

## ConfigMaps and Secrets

kubectl get configmaps
kubectl describe configmap CONFIGMAP_NAME
kubectl get secrets
kubectl describe secret SECRET_NAME

## Storage

kubectl get pvc
kubectl get pv
kubectl get storageclass

## Events

kubectl get events --sort-by=.metadata.creationTimestamp

## Resource Usage

kubectl top pods
kubectl top nodes

Metrics Server is required for kubectl top.

## Labels

kubectl get pods --show-labels
kubectl get pods -l app=nginx

## Apply and Delete

kubectl apply -f manifest.yaml
kubectl apply -f directory/
kubectl delete -f manifest.yaml

## Quick SRE Troubleshooting

kubectl get pods -A
kubectl get pods -o wide
kubectl get nodes
kubectl describe pod POD_NAME
kubectl logs POD_NAME
kubectl logs POD_NAME --previous
kubectl get events --sort-by=.metadata.creationTimestamp
kubectl get services
kubectl get endpointslices

POD_NAME, SERVICE_NAME, and similar values are placeholders and must be replaced with actual resource names.
