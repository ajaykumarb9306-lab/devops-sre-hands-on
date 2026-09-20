# AWS EC2

EC2 provides virtual machines in AWS.

## Important Components

AMI
Instance Type
EBS Volume
Security Group
Subnet
Elastic Network Interface
IAM Role
Key Pair

## Inspect Instances

aws ec2 describe-instances

## Common Instance States

pending
running
stopping
stopped
shutting-down
terminated

## EC2 Troubleshooting Flow

Instance
   |
Instance State
   |
Status Checks
   |
Security Group
   |
Subnet / Routes
   |
Network ACL
   |
Operating System
   |
Application

## SSH Troubleshooting

Verify:

- Instance is running
- Public IP or private network path exists
- Security Group allows TCP 22 from approved source
- Route exists
- Correct SSH username
- Correct private key
- SSH service is running

Example:

ssh -i KEY.pem ubuntu@SERVER_IP

Never commit the private key.

## Disk Problems

Inside Linux:

df -h
du -sh /*
lsblk

AWS-side:

aws ec2 describe-volumes
