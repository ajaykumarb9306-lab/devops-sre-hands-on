# AWS Operational Projects

## Resource Inventory

`aws-resource-inventory.sh` provides a quick operational inventory of:

- Authenticated AWS identity
- EC2 instances
- VPCs
- Subnets
- Security Groups
- S3 buckets
- CloudWatch alarms

Run:

./aws-resource-inventory.sh

AWS authentication and a region must already be configured.

The script intentionally contains no credentials.

## EC2 Web Server

See:

ec2-web-server/README.md

This documents a practical EC2/Nginx architecture and troubleshooting workflow without requiring paid infrastructure to remain running.
