# CI/CD Security

CI/CD systems frequently need credentials for deployments.

Examples:

- Registry credentials
- Cloud credentials
- Kubernetes credentials
- Deployment tokens

## Avoid

Hard-coded secrets in:

- Workflow YAML
- Dockerfiles
- Scripts
- Repository files

## Prefer

- CI/CD secret stores
- Workload identity
- OIDC federation
- Short-lived credentials
- Environment protection
- Least-privilege service accounts

## Logging

Never intentionally print secrets.

Bad:

echo "$API_TOKEN"

Be careful with debug modes because commands or environment variables may appear in logs.
