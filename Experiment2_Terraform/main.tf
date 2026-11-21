terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "local" {}

resource "local_file" "app_config" {
  filename = "${path.module}/application_config.txt"

  content = <<-EOT
    Application: DevOps Demo
    Infrastructure: Terraform
    Environment: Production
    Status: Provisioned Successfully
  EOT
}

output "provisioned_file" {
  value = local_file.app_config.filename
}
