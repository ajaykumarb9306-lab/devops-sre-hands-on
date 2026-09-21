# Git Security

Git repositories are a common source of accidental credential exposure.

## Files Commonly Excluded

.env
*.pem
*.key
terraform.tfvars
credentials.json
service-account.json

Example .gitignore:

.env
*.pem
*.key
credentials.json
service-account.json

## Important

.gitignore does not remove a secret that has already been committed.

If a real credential reaches Git:

1. Revoke or rotate the credential immediately.
2. Determine exposure.
3. Remove sensitive data from the repository/history where appropriate.
4. Review audit logs.
5. Update applications with the new credential.
6. Document the incident.

Deleting the file alone does not make an exposed credential safe.
