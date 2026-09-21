# Azure Identity and Access Management

Azure identity and authorization commonly involve Microsoft Entra ID and Azure Role-Based Access Control.

## Core Model

Identity
   |
Role Assignment
   |
Role
   |
Scope
   |
Azure Resource

## Identities

Examples:

- Users
- Groups
- Service principals
- Managed identities

## RBAC Scope

Management Group
      |
Subscription
      |
Resource Group
      |
Resource

Permissions inherited from higher scopes can apply to lower scopes.

## Common Roles

- Owner
- Contributor
- Reader
- User Access Administrator

Prefer service-specific roles when broad access is unnecessary.

## Managed Identity

Managed identities allow Azure workloads to authenticate to supported services without storing credentials in application code.

Common use cases:

- Virtual Machine -> Key Vault
- App Service -> Storage
- AKS workload -> Azure service
- Automation -> Azure resource

## Inspect Role Assignments

az role assignment list --output table

## Security Principles

- Least privilege
- Avoid unnecessary Owner access
- Prefer managed identities
- Avoid long-lived client secrets
- Review role assignments
- Scope permissions appropriately

## Troubleshooting Access

Check:

1. Logged-in identity
2. Active subscription
3. Role assignment
4. RBAC scope
5. Resource group
6. Resource
7. Deny assignments or policies
