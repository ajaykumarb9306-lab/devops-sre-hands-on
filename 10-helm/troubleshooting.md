# Helm Troubleshooting

## Chart Validation Failure

Run:

helm lint ./CHART_PATH

Then render the generated Kubernetes manifests:

helm template RELEASE_NAME ./CHART_PATH --debug

Check for:

- YAML indentation
- Missing values
- Incorrect template expressions
- Invalid Kubernetes fields

## Installation Failure

Run:

helm install RELEASE_NAME ./CHART_PATH --dry-run --debug

Then inspect Kubernetes events:

kubectl get events --sort-by=.metadata.creationTimestamp

## Release Already Exists

Check:

helm list -A

Either upgrade:

helm upgrade RELEASE_NAME ./CHART_PATH

Or remove the old release:

helm uninstall RELEASE_NAME

## Pods Fail After Helm Install

Helm may successfully create Kubernetes resources while the application itself fails.

Check:

kubectl get pods
kubectl describe pod POD_NAME
kubectl logs POD_NAME
kubectl logs POD_NAME --previous

## Service Has No Backends

Check:

kubectl get services
kubectl get pods --show-labels
kubectl get endpointslices

Verify that Service selectors match Pod labels.

## Upgrade Problems

Check:

helm history RELEASE_NAME
helm status RELEASE_NAME

Rollback when appropriate:

helm rollback RELEASE_NAME REVISION

## Useful Troubleshooting Flow

helm lint ./CHART_PATH
helm template RELEASE_NAME ./CHART_PATH
helm list
helm status RELEASE_NAME
kubectl get pods
kubectl get events --sort-by=.metadata.creationTimestamp
kubectl describe pod POD_NAME
kubectl logs POD_NAME
