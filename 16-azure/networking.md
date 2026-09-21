# Azure Networking

## Virtual Network

Azure Virtual Network provides private networking for Azure resources.

## Core Components

VNet
Subnet
Network Interface
Network Security Group
Route Table
Public IP
Private IP
Load Balancer
Application Gateway
NAT Gateway
Private Endpoint

## Network Security Groups

NSGs contain inbound and outbound security rules.

List:

az network nsg list --output table

## Virtual Networks

az network vnet list --output table

## Network Interfaces

az network nic list --output table

## Public IPs

az network public-ip list --output table

## Troubleshooting Flow

Client
   |
DNS
   |
Public IP / Load Balancer
   |
NSG
   |
Route
   |
NIC
   |
Operating System Firewall
   |
Application Port

When connectivity fails, verify each layer instead of immediately changing firewall rules.
