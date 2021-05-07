# Nindevdo org
module "nindevdo" {
  source      = "./_modules/github/repository"
  name        = "nindevdo"
  description = "The github-org and main repository for the nindevdo organization. Infrastructure that applies to either the org or the org globally goes into this repo."
  push_teams  = [module.devs.id]
  admin_teams = [module.bots.id]
}

# Valheim-Smior
module "Valheim-Smior" {
  source      = "./_modules/github/repository"
  name        = "Valheim-Smior"
  description = "Valheim in terraform for AWS lighsail"
  push_teams  = [module.devs.id]
  admin_teams = [module.bots.id]
}

# haxor.space
module "haxor-space" {
  source      = "./_modules/github/repository"
  name        = "haxor.space"
  description = "the haxor.space domain"
  push_teams  = [module.devs.id]
  admin_teams = [module.bots.id]
}

# nindevdo.com
module "nindevdo-com" {
  source      = "./_modules/github/repository"
  name        = "nindevdo.com"
  description = "the nindevdo.com domain"
  push_teams  = [module.devs.id]
  admin_teams = [module.bots.id]
}

