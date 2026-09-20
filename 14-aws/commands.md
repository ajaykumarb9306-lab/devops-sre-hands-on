# AWS CLI Command Reference

## Identity

aws sts get-caller-identity

## Regions

aws ec2 describe-regions \
  --query 'Regions[].RegionName' \
  --output table

## EC2

aws ec2 describe-instances

aws ec2 describe-instances \
  --query 'Reservations[].Instances[].{ID:InstanceId,State:State.Name,Type:InstanceType,PrivateIP:PrivateIpAddress,PublicIP:PublicIpAddress}' \
  --output table

aws ec2 describe-security-groups

aws ec2 describe-volumes

## VPC

aws ec2 describe-vpcs
aws ec2 describe-subnets
aws ec2 describe-route-tables
aws ec2 describe-internet-gateways
aws ec2 describe-network-acls
aws ec2 describe-network-interfaces

## S3

aws s3 ls
aws s3 ls s3://BUCKET_NAME
aws s3 cp FILE s3://BUCKET_NAME/
aws s3 cp s3://BUCKET_NAME/FILE .
aws s3 sync DIRECTORY s3://BUCKET_NAME/

## IAM

aws iam list-users
aws iam list-roles
aws iam list-policies --scope Local

## CloudWatch

aws cloudwatch list-metrics

aws cloudwatch describe-alarms

aws logs describe-log-groups

aws logs describe-log-streams \
  --log-group-name LOG_GROUP

## Systems Manager

aws ssm describe-instance-information

## Useful Output Formats

--output json
--output table
--output text

## Useful Query Example

aws ec2 describe-instances \
  --query 'Reservations[].Instances[].InstanceId' \
  --output text
