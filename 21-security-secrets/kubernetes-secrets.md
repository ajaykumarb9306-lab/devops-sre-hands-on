# Kubernetes Secrets

Kubernetes provides a Secret resource for sensitive configuration.

## Create a Secret

kubectl create secret generic app-credentials \
  --from-literal=username=demo-user \
  --from-literal=password=demo-password

## View Secrets

kubectl get secrets

## Important

Base64 encoding is not encryption.

Kubernetes Secret values may appear base64 encoded in manifests/API responses.

Production security should consider:

- Encryption at rest
- RBAC
- External secret managers
- Secret rotation
- Namespace isolation
- Audit logging

## Consume as Environment Variable

env:
  - name: DB_PASSWORD
    valueFrom:
      secretKeyRef:
        name: app-credentials
        key: password

## Better GitOps Pattern

Avoid storing plaintext production credentials in Git.

Common approaches include:

- External Secrets Operator
- Sealed Secrets
- Vault
- Cloud secret managers
