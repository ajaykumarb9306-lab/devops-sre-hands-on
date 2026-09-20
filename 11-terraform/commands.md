# Terraform Command Reference

## Initialize

terraform init

## Format

terraform fmt
terraform fmt -recursive
terraform fmt -check

## Validate

terraform validate

## Plan

terraform plan
terraform plan -out=tfplan

## Apply

terraform apply
terraform apply tfplan
terraform apply -auto-approve

## Destroy

terraform destroy
terraform destroy -auto-approve

## State

terraform state list
terraform state show RESOURCE_ADDRESS

## Outputs

terraform output
terraform output OUTPUT_NAME

## Variables

terraform plan -var="environment=dev"

terraform plan -var-file="terraform.tfvars"

## Providers

terraform providers

## Configuration

terraform show
terraform version

## Refresh State

terraform plan -refresh-only

## Replace Resource

terraform apply -replace="RESOURCE_ADDRESS"

## Import Existing Resource

terraform import RESOURCE_ADDRESS RESOURCE_ID

## Useful Validation Sequence

terraform fmt -recursive
terraform validate
terraform plan
