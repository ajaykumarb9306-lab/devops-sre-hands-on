# AWS IAM

IAM controls authentication and authorization in AWS.

## Main Components

User
Group
Role
Policy

## IAM Policy

Policies define permissions using JSON.

Important fields:

Effect
Action
Resource
Condition

## Principle of Least Privilege

Grant only the permissions required to perform a task.

Avoid broad permissions such as:

Action: "*"
Resource: "*"

unless specifically required and reviewed.

## IAM Roles

Roles provide temporary credentials.

Common use cases:

- EC2 instance roles
- Lambda execution roles
- CI/CD pipelines
- Cross-account access
- Kubernetes workloads

## Production Guidance

Prefer:

IAM Roles
Temporary Credentials
Workload Identity

over long-lived IAM user access keys.

## Troubleshooting Access

Check authenticated identity:

aws sts get-caller-identity

Then investigate:

- IAM policy
- Resource policy
- Permission boundary
- Service Control Policy
- Explicit deny
- Role trust policy
