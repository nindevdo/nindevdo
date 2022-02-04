#To get the team id if importing you can run `curl -H "Authorization: token $TF_VAR_github_token"  https://api.github.com/orgs/$TF_VAR_github_owner/teams`
module "bots" {
  source      = "../../modules/github/team"
  description = "Team for Bots"
  name        = "beep-boop"
  privacy     = "secret"
}

module "devs" {
 source      = "../../modules/github/team"
 description = "Team for devs"
 name        = "A team that pushes code like it's going out of style"
 privacy     = "secret"
}