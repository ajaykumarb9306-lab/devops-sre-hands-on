# Secrets Management

## Bad

Hard-coded credential:

DB_PASSWORD=my-real-password

Committed into Git:

config.yaml
application.properties
.env

## Better

Applications retrieve secrets at runtime from controlled sources.

Examples:

- Environment variables
- Kubernetes Secrets
- HashiCorp Vault
- AWS Secrets Manager
- Google Secret Manager
- Azure Key Vault

## Production Pattern

Application
     |
     v
Secret Manager
     |
Authentication / Authorization
     |
     v
Secret

## Important Principles

- Never commit secrets
- Encrypt secrets appropriately
- Restrict access
- Audit secret access
- Rotate credentials
- Use short-lived credentials where possible
- Separate secrets between environments
