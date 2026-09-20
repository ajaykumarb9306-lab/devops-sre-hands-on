variable "project_name" {
  description = "Name of the application"
  type        = string
  default     = "devops-sre-app"
}

variable "environment" {
  description = "Deployment environment"

  type = string

  default = "development"

  validation {
    condition     = contains(["development", "staging", "production"], var.environment)
    error_message = "Environment must be development, staging, or production."
  }
}

variable "owner" {
  description = "Owner of the infrastructure"
  type        = string
  default     = "DevOps-SRE"
}
