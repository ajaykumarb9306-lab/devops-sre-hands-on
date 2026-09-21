# Azure Troubleshooting

## Authentication

Check:

az account show
az account list --output table

Common issues:

- Not logged in
- Wrong tenant
- Wrong subscription
- Missing RBAC role

## VM Unreachable

Check:

az vm list --show-details --output table
az network nic list --output table
az network nsg list --output table
az network public-ip list --output table

Then investigate:

- VM state
- NIC
- IP address
- NSG
- Route
- OS firewall
- Application

## Permission Denied

Check:

az account show
az role assignment list --output table

Review:

- Identity
- Subscription
- RBAC role
- Scope
- Resource group
- Azure Policy

## Application Failure

Investigation:

DNS
 |
Load Balancer / Application Gateway
 |
NSG
 |
VM / AKS
 |
Application
 |
Dependencies
 |
Logs

## General SRE Flow

Identify symptom
  |
Determine blast radius
  |
Check metrics
  |
Check logs
  |
Check network
  |
Check identity
  |
Check infrastructure
  |
Check application
  |
Recover
  |
Perform root-cause analysis
