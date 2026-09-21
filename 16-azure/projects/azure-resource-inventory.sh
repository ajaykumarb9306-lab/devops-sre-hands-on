#!/bin/bash

set -euo pipefail

echo "================================="
echo " Azure Resource Inventory"
echo "================================="

echo
echo "Current Account / Subscription"
az account show \
  --query "{subscription:name, subscriptionId:id, tenantId:tenantId}" \
  --output table

echo
echo "Resource Groups"
az group list --output table

echo
echo "Virtual Machines"
az vm list --show-details --output table

echo
echo "Virtual Networks"
az network vnet list --output table

echo
echo "Network Security Groups"
az network nsg list --output table

echo
echo "Public IP Addresses"
az network public-ip list --output table

echo
echo "Managed Disks"
az disk list --output table

echo
echo "Storage Accounts"
az storage account list --output table

echo
echo "Resources"
az resource list \
  --query "[].{Name:name,Type:type,ResourceGroup:resourceGroup,Location:location}" \
  --output table
