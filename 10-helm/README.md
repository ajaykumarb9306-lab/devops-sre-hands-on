# Helm Hands-On

Practical Helm reference for deploying and managing Kubernetes applications.

## What Helm Does

Helm packages Kubernetes resources into reusable Charts.

Instead of maintaining separate hard-coded manifests for every environment:

Kubernetes Manifests
        |
        v
Helm Templates + values.yaml
        |
        v
Reusable Kubernetes Deployment

## Chart Structure

charts/web-app/
├── Chart.yaml
├── values.yaml
└── templates/
    ├── _helpers.tpl
    ├── configmap.yaml
    ├── deployment.yaml
    └── service.yaml

## Install

helm install web-app ./charts/web-app

## Upgrade

helm upgrade web-app ./charts/web-app

## Install or Upgrade

helm upgrade --install web-app ./charts/web-app

## Check Release

helm list

## Render Templates

helm template web-app ./charts/web-app

## Validate Chart

helm lint ./charts/web-app

## Uninstall

helm uninstall web-app
