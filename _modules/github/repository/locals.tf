locals {

  push_teams = {
    for v in var.push_teams:
      index(var.push_teams, v) => v
  }

  admin_teams = {
    for v in var.admin_teams:
      index(var.admin_teams, v) => v
  }
}
