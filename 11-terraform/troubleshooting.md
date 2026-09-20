# Terraform Troubleshooting

## Initialization Problems

Run:

terraform init

If providers or modules changed:

terraform init -upgrade

## Formatting Problems

Run:

terraform fmt -recursive

Check formatting without modifying files:

terraform fmt -check -recursive

## Configuration Errors

Run:

terraform validate

Common causes:

- Invalid HCL syntax
- Missing braces
- Incorrect resource arguments
- Invalid references
- Incorrect variable types

## Provider Problems

Check:

terraform providers

Then:

terraform init -upgrade

## Plan Unexpectedly Changes Resources

Run:

terraform plan

Review:

- Variable changes
- Provider changes
- Resource configuration
- External infrastructure changes
- State differences

## Inspect State

terraform state list

terraform state show RESOURCE_ADDRESS

Do not manually edit terraform.tfstate unless absolutely necessary.

## Resource Exists Outside Terraform

Existing infrastructure may need to be imported:

terraform import RESOURCE_ADDRESS RESOURCE_ID

## Authentication Problems

Cloud providers require valid authentication.

Never hard-code cloud credentials inside Terraform files.

Use supported authentication methods such as:

- Environment variables
- CLI authentication
- Workload identity
- IAM roles
- Service accounts

## Debug Logging

Enable detailed Terraform logs:

export TF_LOG=DEBUG

Disable:

unset TF_LOG

Avoid sharing debug logs without reviewing them for sensitive information.

## Standard Troubleshooting Flow

terraform version
terraform init
terraform fmt -check -recursive
terraform validate
terraform providers
terraform plan
terraform state list
