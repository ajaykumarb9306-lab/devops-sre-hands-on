#!/bin/bash

set -euo pipefail

echo "================================="
echo " GCP Resource Inventory"
echo "================================="

echo
echo "Active Account"
gcloud auth list --filter=status:ACTIVE \
  --format="value(account)"

echo
echo "Current Project"
gcloud config get-value project

echo
echo "Compute Instances"
gcloud compute instances list

echo
echo "VPC Networks"
gcloud compute networks list

echo
echo "Subnets"
gcloud compute networks subnets list

echo
echo "Firewall Rules"
gcloud compute firewall-rules list

echo
echo "Disks"
gcloud compute disks list

echo
echo "Cloud Storage Buckets"
gcloud storage buckets list

echo
echo "Service Accounts"
gcloud iam service-accounts list
