#!/bin/bash

set -euo pipefail

echo "================================="
echo " AWS Resource Inventory"
echo "================================="

echo
echo "Authenticated Identity"
aws sts get-caller-identity

echo
echo "EC2 Instances"
aws ec2 describe-instances \
  --query 'Reservations[].Instances[].{ID:InstanceId,State:State.Name,Type:InstanceType,PrivateIP:PrivateIpAddress,PublicIP:PublicIpAddress}' \
  --output table

echo
echo "VPCs"
aws ec2 describe-vpcs \
  --query 'Vpcs[].{VpcId:VpcId,CIDR:CidrBlock,Default:IsDefault}' \
  --output table

echo
echo "Subnets"
aws ec2 describe-subnets \
  --query 'Subnets[].{SubnetId:SubnetId,VpcId:VpcId,CIDR:CidrBlock,AZ:AvailabilityZone}' \
  --output table

echo
echo "Security Groups"
aws ec2 describe-security-groups \
  --query 'SecurityGroups[].{Name:GroupName,ID:GroupId,VPC:VpcId}' \
  --output table

echo
echo "S3 Buckets"
aws s3 ls

echo
echo "CloudWatch Alarms"
aws cloudwatch describe-alarms \
  --query 'MetricAlarms[].{Name:AlarmName,State:StateValue}' \
  --output table
