# CI/CD Troubleshooting

## Pipeline Does Not Start

Check:

- Workflow location
- YAML syntax
- Trigger configuration
- Branch filters

GitHub Actions workflows must be located under:

.github/workflows/

## Pipeline Fails After Push

Open the GitHub Actions run and identify:

Job
  ↓
Failed Step
  ↓
Command
  ↓
Error Output

Reproduce the failing command locally when possible.

## Terraform Failure

Run locally:

terraform fmt -check -recursive
terraform init -backend=false
terraform validate

## Helm Failure

Run:

helm lint CHART_PATH
helm template RELEASE_NAME CHART_PATH

## Python Failure

Run:

python3 -m compileall DIRECTORY

## Kubernetes Failure

Validate the affected manifest using kubectl dry-run.

## Secret Problems

Verify:

- Secret exists
- Secret name is correct
- Workflow references the correct secret
- Credential has required permissions

Never print secrets into pipeline logs.

## Troubleshooting Flow

Trigger
  ↓
Workflow
  ↓
Job
  ↓
Step
  ↓
Command
  ↓
Application / Infrastructure
