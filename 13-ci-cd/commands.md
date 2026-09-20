# CI/CD Command Reference

## Git Workflow

git status
git add .
git commit -m "message"
git push origin main

## Terraform Validation

terraform fmt -check -recursive
terraform init -backend=false
terraform validate

## Python Validation

python -m compileall 06-python

## Helm Validation

helm lint 10-helm/charts/web-app
helm template web-app 10-helm/charts/web-app

## Kubernetes Client Validation

kubectl apply --dry-run=client -f MANIFEST.yaml

## GitHub Actions

Workflow files are stored under:

.github/workflows/

Common triggers:

push
pull_request
workflow_dispatch

Pipeline failures should be investigated before changes are merged or deployed.
