terraform {
  required_version = ">= 1.13.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "local" {}

locals {
  application_name = "${var.project_name}-${var.environment}"
}

resource "local_file" "application_config" {
  filename = "${path.module}/generated/app-config.txt"

  content = <<-EOT
    Application: ${local.application_name}
    Environment: ${var.environment}
    Owner: ${var.owner}
    Managed-By: Terraform
  EOT
}
