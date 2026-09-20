# Terraform Local Infrastructure Project

Hands-on Terraform project demonstrating:

- Providers
- Resources
- Variables
- Variable validation
- Locals
- Outputs
- Terraform state
- Plan
- Apply
- Infrastructure changes
- Destroy

This project intentionally uses the local provider so the complete Terraform lifecycle can be practiced without requiring a cloud account or creating cloud charges.

## Initialize

terraform init

## Format

terraform fmt

## Validate

terraform validate

## Plan

terraform plan

## Apply

terraform apply

## Inspect

terraform state list
terraform output

## Change Infrastructure

terraform apply -var="environment=staging"

## Destroy

terraform destroy
