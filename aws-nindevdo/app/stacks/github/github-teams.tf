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