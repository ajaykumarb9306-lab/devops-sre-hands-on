# Azure Storage

Azure Storage provides several storage services.

## Services

- Blob Storage
- Azure Files
- Queue Storage
- Table Storage

## Storage Accounts

List:

az storage account list --output table

Inspect:

az storage account show \
  --resource-group RESOURCE_GROUP \
  --name STORAGE_ACCOUNT

## Blob Containers

az storage container list \
  --account-name STORAGE_ACCOUNT \
  --auth-mode login \
  --output table

## Security

Prefer:

- Entra ID authentication
- Azure RBAC
- Managed identities
- Private endpoints when required
- Secure transfer
- Appropriate network restrictions

Avoid embedding storage account keys or connection strings in source code.

## Operations Considerations

Review:

- Redundancy
- Access tier
- Lifecycle policies
- Capacity
- Transactions
- Network access
- Data protection
