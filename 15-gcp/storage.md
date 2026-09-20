# Google Cloud Storage

Cloud Storage provides object storage.

## Common Uses

- Backups
- Logs
- Application artifacts
- Static content
- Data storage
- Terraform state

## Commands

List buckets:

gcloud storage buckets list

List objects:

gcloud storage ls gs://BUCKET_NAME

Upload:

gcloud storage cp FILE gs://BUCKET_NAME/

Download:

gcloud storage cp gs://BUCKET_NAME/FILE .

Synchronize:

gcloud storage rsync DIRECTORY gs://BUCKET_NAME --recursive

## Security

Review:

- IAM
- Uniform bucket-level access
- Public access prevention
- Encryption
- Retention policies
- Lifecycle policies

Avoid public access unless intentionally required.
