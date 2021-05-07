# The configuration for the `remote` backend.
terraform {
  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "nindevdo"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "nindevdo"
    }
  }
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.9.2"
    }
  }
}
