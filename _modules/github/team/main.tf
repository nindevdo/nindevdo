resource "github_team" "main" {
    name        = var.name
    description = var.description
    privacy     = var.privacy
}

resource "github_team_repository" "repos" {
    for_each    = var.repositories
    team_id     = github_team.main.id
    repository  = each.key
    permission  = each.value.permission
}

resource "github_team_membership" "owner" {
  for_each = var.users
  username = each.key
  team_id  = github_team.main.id
  role     = each.value.role
} 
