# Terraform Hands-On

Practical Terraform reference for Infrastructure as Code (IaC).

## What Terraform Does

Terraform manages infrastructure using declarative configuration files.

Typical workflow:

Write Configuration
        |
terraform init
        |
terraform fmt
        |
terraform validate
        |
terraform plan
        |
terraform apply
        |
Infrastructure

Terraform tracks managed resources using state.

## Core Files

main.tf       - Resources and providers
variables.tf  - Input variables
outputs.tf    - Output values
terraform.tfvars - Variable values

## Core Workflow

terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy

## Important

Never commit:

- terraform.tfstate
- terraform.tfstate.backup
- .terraform/
- sensitive tfvars files
- cloud credentials
- provider credentials
