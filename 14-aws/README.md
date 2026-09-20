# AWS Hands-On

Practical AWS reference for DevOps and SRE work.

## Core Areas

- AWS CLI
- IAM
- EC2
- VPC networking
- Security Groups
- S3
- CloudWatch
- Systems Manager
- Troubleshooting

## Typical Application Architecture

Internet
   |
Route 53
   |
Load Balancer
   |
Security Group
   |
EC2 / Containers
   |
Database

Supporting services:

CloudWatch -> Monitoring and Logs
IAM        -> Authentication and Authorization
S3         -> Object Storage
SSM        -> Server Management

## AWS CLI

Verify:

aws --version

Check authenticated identity:

aws sts get-caller-identity

Check configured region:

aws configure get region

## Security

Never commit:

- Access keys
- Secret access keys
- Session tokens
- SSH private keys
- AWS credentials files

Prefer temporary credentials and IAM roles instead of long-lived access keys.
