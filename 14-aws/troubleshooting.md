# AWS Troubleshooting

## Authentication

Start with:

aws sts get-caller-identity

Common issues:

- No credentials
- Expired credentials
- Wrong profile
- Incorrect role
- Insufficient IAM permissions

## EC2 Unreachable

Check:

aws ec2 describe-instances
aws ec2 describe-security-groups
aws ec2 describe-route-tables
aws ec2 describe-network-acls

Then verify the OS and application.

## Application Not Reachable

Troubleshooting path:

DNS
  |
Load Balancer
  |
Target Health
  |
Security Group
  |
Network
  |
Instance
  |
Application Process
  |
Application Port

## AccessDenied

Identify the caller:

aws sts get-caller-identity

Then review:

- Identity policy
- Resource policy
- Permission boundary
- SCP
- Explicit deny
- Role trust relationship

## S3 Access Problems

Check:

- Bucket name
- IAM permissions
- Bucket policy
- Public Access Block
- Encryption permissions
- Object ownership

## CloudWatch Logs Missing

Check:

- Log group
- Agent/application configuration
- IAM permissions
- Region
- Log stream
- Resource health

## General SRE Flow

Identify symptom
  |
Determine affected AWS resource
  |
Check metrics and logs
  |
Check IAM
  |
Check networking
  |
Check resource configuration
  |
Check application
  |
Recover
  |
Document root cause
