# GCP Command Reference

## Authentication

gcloud auth list

## Configuration

gcloud config list
gcloud config get-value project
gcloud config get-value compute/region
gcloud config get-value compute/zone

## Projects

gcloud projects list
gcloud projects describe PROJECT_ID

## Compute Engine

gcloud compute instances list

gcloud compute instances describe INSTANCE_NAME \
  --zone=ZONE

## Networks

gcloud compute networks list
gcloud compute networks subnets list
gcloud compute routes list
gcloud compute firewall-rules list

## Disks

gcloud compute disks list

## Service Accounts

gcloud iam service-accounts list

## IAM

gcloud projects get-iam-policy PROJECT_ID

## Cloud Storage

gcloud storage buckets list
gcloud storage ls gs://BUCKET_NAME
gcloud storage cp FILE gs://BUCKET_NAME/
gcloud storage cp gs://BUCKET_NAME/FILE .

## Logging

gcloud logging logs list

gcloud logging read \
  'severity>=ERROR' \
  --limit=20

## Monitoring

gcloud monitoring metrics-scopes list

## APIs

gcloud services list --enabled

## Output Formats

--format=json
--format=table
--format=value
