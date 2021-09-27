# Nindevdo org
module "nindevdo" {
  source      = "../../modules/github/repository"
  name        = "nindevdo"
  description = "The github-org and main repository for the nindevdo organization. Infrastructure that applies to either the org or the org globally goes into this repo."

}

# Valheim-Smior
module "Valheim-Smior" {
  source      = "../../modules/github/repository"
  name        = "Valheim-Smior"
  description = "Valheim in terraform for AWS lighsail"
}

# haxor.space
module "haxor-space" {
  source      = "../../modules/github/repository"
  name        = "haxor.space"
  description = "the haxor.space domain"
}

# nindevdo.com
module "nindevdo-com" {
  source      = "../../modules/github/repository"
  name        = "nindevdo.com"
  description = "the nindevdo.com domain"
}

module "barch" {
  source      = "../../modules/github/repository"
  name        = "barch"
  description = "barch (BlackArch)"
}
module "gitini" {
  source      = "../../modules/github/repository"
  name        = "gitini"
  description = "gitini"
}

module "haxor-space-vault" {
  source      = "../../modules/github/repository"
  name        = "haxor.space-vault"
  description = "haxor.space-vault"
}
module "kubernetes-admin" {
  source      = "../../modules/github/repository"
  name        = "kubernetes-admin"
  description = "kubernetes-admin"
}