# Least Privilege

Least privilege means giving identities only the permissions required to perform their job.

Bad:

Application -> Administrator access

Better:

Application -> Only required API/database/resource permissions

Apply least privilege to:

- Users
- Service accounts
- CI/CD pipelines
- Kubernetes RBAC
- Cloud IAM
- Database accounts
- API tokens

## Questions

Ask:

- What resource does this identity need?
- What actions does it need?
- Which environment?
- How long does access need to exist?
- Can temporary credentials be used?
