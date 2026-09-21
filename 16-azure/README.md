# Microsoft Azure Hands-On

Practical Azure reference for DevOps, SRE, cloud operations, and FinOps.

## Core Areas

- Azure CLI
- Subscriptions
- Resource Groups
- Microsoft Entra ID
- Azure RBAC
- Virtual Machines
- Virtual Networks
- Network Security Groups
- Storage Accounts
- Azure Monitor
- Log Analytics
- Cost Management
- Troubleshooting

## Resource Hierarchy

Management Group
      |
Subscription
      |
Resource Group
      |
Resources

## Typical Application Architecture

Internet
   |
Azure Load Balancer / Application Gateway
   |
Virtual Network
   |
Network Security Group
   |
Virtual Machine / AKS
   |
Application

Supporting services:

Azure Monitor     -> Metrics and Alerts
Log Analytics     -> Centralized Logs
Entra ID / RBAC   -> Identity and Access
Storage Account   -> Object/File Storage
Cost Management   -> Cost Visibility

## Security

Never commit:

- Client secrets
- Access tokens
- Storage account keys
- Connection strings
- Certificates
- Service principal credentials
