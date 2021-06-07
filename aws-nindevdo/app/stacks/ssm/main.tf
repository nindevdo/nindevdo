resource "aws_ssm_parameter" "github_owner" {
  name        = "github-dev-github_owner"
  description = "The parameter description"
  type        = "String"
  value       = var.github_owner

  tags = {
    environment = "<%= " #{Terraspace.env}" %>"
  }
}

resource "aws_ssm_parameter" "github_token" {
  name        = "github-dev-github_token"
  description = "The github org token for environment"
  type        = "SecureString"
  value       = var.github_token

  tags = {
    environment = "<%= " #{Terraspace.env}" %>"
  }
}