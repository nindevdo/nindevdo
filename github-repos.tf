# Nindevdo org
module "nindevdo" {
  source      = "./_modules/github/repository"
  name        = "nindevdo"
  description = "The github-org and main repository for the nindevdo organization. Infrastructure that applies to either the org or the org globally goes into this repo."

}

# Valheim-Smior
module "Valheim-Smior" {
  source      = "./_modules/github/repository"
  name        = "Valheim-Smior"
  description = "Valheim in terraform for AWS lighsail"
}

# haxor.space
module "haxor-space" {
  source      = "./_modules/github/repository"
  name        = "haxor.space"
  description = "the haxor.space domain"
}

# nindevdo.com
module "nindevdo-com" {
  source      = "./_modules/github/repository"
  name        = "nindevdo.com"
  description = "the nindevdo.com domain"
}