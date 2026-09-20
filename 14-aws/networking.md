# AWS Networking

## VPC

A VPC is an isolated virtual network in AWS.

Typical architecture:

VPC
|
+-- Public Subnet
|     |
|     +-- Load Balancer
|
+-- Private Subnet
      |
      +-- Application
      +-- Database

## Public Subnet

Typically has a route to an Internet Gateway.

## Private Subnet

Does not directly expose workloads to the public internet.

Outbound internet access may use a NAT Gateway or another approved egress design.

## Route Table

Route tables determine where network traffic is sent.

## Security Group

Security Groups are stateful virtual firewalls attached to resources.

Examples:

HTTP  TCP 80
HTTPS TCP 443
SSH   TCP 22

Avoid exposing administrative ports broadly.

## Network ACL

Network ACLs operate at the subnet level and are stateless.

## Troubleshooting Flow

DNS
 |
Load Balancer
 |
Security Group
 |
Route Table
 |
Network ACL
 |
Network Interface
 |
Operating System Firewall
 |
Application Port

Useful commands:

aws ec2 describe-vpcs
aws ec2 describe-subnets
aws ec2 describe-route-tables
aws ec2 describe-security-groups
aws ec2 describe-network-acls
aws ec2 describe-network-interfaces
