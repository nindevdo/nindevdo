resource "github_repository" "repo" {
  allow_merge_commit     = var.allow_merge_commit
  allow_rebase_merge     = var.allow_rebase_merge
  archived               = var.archived
  delete_branch_on_merge = var.delete_branch_on_merge
  description            = var.description
  has_downloads          = var.has_downloads
  has_issues             = var.has_issues
  has_projects           = var.has_projects
  has_wiki               = var.has_wiki
  name                   = var.name
  visibility             = var.visibility
  vulnerability_alerts   = var.vulnerability_alerts
  pages {
    source {
      branch = "main"
      path   = "/"
    }
  }
}


# Branch protection
resource "github_branch_protection" "main" {
  repository_id = github_repository.repo.id

  pattern          = "main"
  enforce_admins   = true
  allows_deletions = false

  required_status_checks {
    strict   = false
    contexts = [ "Terraform" ]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews = true
  }
}