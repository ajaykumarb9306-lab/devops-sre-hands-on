output "application_name" {
  description = "Generated application name"
  value       = local.application_name
}

output "configuration_file" {
  description = "Path of the Terraform-managed configuration file"
  value       = local_file.application_config.filename
}
