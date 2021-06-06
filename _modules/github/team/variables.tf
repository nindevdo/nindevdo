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