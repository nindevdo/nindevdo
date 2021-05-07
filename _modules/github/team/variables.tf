variable "name" {
  description = "team name"
  type        = string
}

variable "description" {
  description = "description"
  type        = string
}

variable "privacy" {
  description   = "privacy"
  type          = string
  default       = "closed"
}

variable "repositories" {
  description   = "repo in team"
  type          = map(object({
      permission = string
  }))
}

variable "users" {
  description   = "users of team"
  type          = map(object({
      role = string
  }))
} 
