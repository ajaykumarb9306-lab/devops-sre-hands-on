# Azure CLI Command Reference

## CLI

az version
az account show
az account list --output table

## Authentication

az login
az account show

## Subscriptions

az account list --output table
az account set --subscription SUBSCRIPTION_ID

## Resource Groups

az group list --output table
az group show --name RESOURCE_GROUP

## Resources

az resource list --output table

az resource list \
  --resource-group RESOURCE_GROUP \
  --output table

## Virtual Machines

az vm list --output table

az vm list \
  --show-details \
  --output table

az vm show \
  --resource-group RESOURCE_GROUP \
  --name VM_NAME

## Virtual Networks

az network vnet list --output table

## Subnets

az network vnet subnet list \
  --resource-group RESOURCE_GROUP \
  --vnet-name VNET_NAME \
  --output table

## Network Security Groups

az network nsg list --output table

az network nsg rule list \
  --resource-group RESOURCE_GROUP \
  --nsg-name NSG_NAME \
  --output table

## Public IP Addresses

az network public-ip list --output table

## Network Interfaces

az network nic list --output table

## Storage Accounts

az storage account list --output table

## Managed Disks

az disk list --output table

## Entra ID / Service Principals

az ad sp list --display-name APPLICATION_NAME

## Role Assignments

az role assignment list --output table

## Azure Monitor

az monitor metrics list \
  --resource RESOURCE_ID \
  --metric Percentage CPU

## Output Formats

--output table
--output json
--output yaml
--output tsv
