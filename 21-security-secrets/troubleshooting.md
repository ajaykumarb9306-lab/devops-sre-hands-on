# Security Troubleshooting

## Application Cannot Access Secret

Check:

1. Secret exists
2. Correct secret name
3. Correct key
4. Namespace
5. RBAC/IAM
6. Application identity
7. Secret manager connectivity

## Credential Works Locally but Not CI/CD

Check:

- Secret configured in CI/CD
- Environment/repository scope
- Permissions
- Variable name
- Expiration
- Branch/environment restrictions

## Secret Accidentally Committed

Do not simply delete the file and assume the issue is resolved.

Response:

1. Revoke/rotate credential
2. Determine repository exposure
3. Review logs
4. Replace credential
5. Remove sensitive history where required
6. Add prevention controls
7. Document incident

## Permission Denied

Check:

- Identity
- IAM/RBAC role
- Resource
- Namespace/project/account
- Policy
- Credential expiration
