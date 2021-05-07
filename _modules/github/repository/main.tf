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
}

# resource "github_team_repository" "push_teams"{
#   for_each = local.push_teams
#   team_id    = each.value
#   repository = github_repository.repo.name
#   permission = "push"
# }
#
# resource "github_team_repository" "admin_teams"{
#   for_each = local.admin_teams
#   team_id    = each.value
#   repository = github_repository.repo.name
#   permission = "admin"
# }
