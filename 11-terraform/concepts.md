# Terraform Concepts

## Provider

Providers allow Terraform to communicate with external platforms.

Examples:

- AWS
- Google Cloud
- Azure
- Kubernetes
- GitHub

## Resource

A resource represents infrastructure managed by Terraform.

Example:

resource "local_file" "example" {
  filename = "example.txt"
  content  = "Managed by Terraform"
}

## Variable

Variables make configurations reusable.

Example:

variable "environment" {
  type    = string
  default = "dev"
}

## Output

Outputs expose useful information after Terraform applies infrastructure.

## Locals

Locals allow reusable expressions inside Terraform configuration.

## State

Terraform state maps configuration to real infrastructure.

Common local state file:

terraform.tfstate

State may contain sensitive information and should not be committed.

Production environments commonly use remote state.

## Desired State

Terraform compares:

Configuration
     |
     v
Terraform State
     |
     v
Real Infrastructure

Terraform generates a plan describing the changes required to reach the desired state.

## Idempotency

Running Terraform repeatedly without configuration changes should result in no infrastructure changes.

## Dependency Graph

Terraform automatically determines resource dependencies and creates resources in the required order.
