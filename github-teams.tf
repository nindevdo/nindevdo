module "bots" {
  source      = "./_modules/github/team"
  description = "Team for Bots"
  name        = "beep-boop"
  privacy     = "secret"
  repositories = {
    # github_repository.nindevdo.name = { permission = "admin" },
  }

  users = {
    "bandithak"        = { role = "maintainer" }
    "brandoncamenisch" = { role = "maintainer" },
    "lilbytes"         = { role = "maintainer" },
  }
}

module "devs" {
  source      = "./_modules/github/team"
  description = "Team for devs"
  name        = "A team that pushes code like it's going out of style"
  privacy     = "secret"
  repositories = {
    # github_repository.nindevdo.name = { permission = "push" },
  }

  users = {
    "bandithak"        = { role = "maintainer" }
    "brandoncamenisch" = { role = "maintainer" },
    "lilbytes"         = { role = "maintainer" },
  }
}
