# Helm Command Reference

## Version

helm version

## Create Chart

helm create CHART_NAME

## Validate

helm lint ./CHART_PATH

## Render Without Installing

helm template RELEASE_NAME ./CHART_PATH

## Install

helm install RELEASE_NAME ./CHART_PATH

## Install With Custom Value

helm install RELEASE_NAME ./CHART_PATH \
  --set replicaCount=5

## Install Using Values File

helm install RELEASE_NAME ./CHART_PATH \
  -f values-production.yaml

## Upgrade

helm upgrade RELEASE_NAME ./CHART_PATH

## Upgrade or Install

helm upgrade --install RELEASE_NAME ./CHART_PATH

## Releases

helm list
helm list -A

## Release Status

helm status RELEASE_NAME

## History

helm history RELEASE_NAME

## Rollback

helm rollback RELEASE_NAME REVISION

## Uninstall

helm uninstall RELEASE_NAME

## Repositories

helm repo add REPO_NAME REPO_URL
helm repo list
helm repo update
helm search repo SEARCH_TERM

## Debug Rendering

helm template RELEASE_NAME ./CHART_PATH --debug

## Dry Run

helm install RELEASE_NAME ./CHART_PATH \
  --dry-run \
  --debug
