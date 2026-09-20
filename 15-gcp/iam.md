# GCP IAM

IAM controls who can perform actions on Google Cloud resources.

## Core Model

Principal
   |
Role
   |
Permissions
   |
Resource

## Principals

Examples:

- User
- Group
- Service account
- Workload identity

## Roles

Basic roles:

- Owner
- Editor
- Viewer

Predefined roles provide service-specific permissions.

Custom roles can provide organization-specific permission sets.

## Service Accounts

Service accounts provide identities for workloads.

Examples:

- Compute Engine VM
- GKE workload
- CI/CD pipeline
- Automation

Prefer workload identities and attached service accounts over downloaded service account keys.

## Inspect IAM

gcloud projects get-iam-policy PROJECT_ID

## Least Privilege

Grant only the permissions required by the workload or administrator.

Avoid broad Owner or Editor permissions unless specifically required.

## Troubleshooting

Check:

- Active identity
- Project
- IAM role
- Resource hierarchy
- Organization policies
- Service account
- API enablement
