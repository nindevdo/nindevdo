variable "name" {
  description = "repo name"
  type        = string
}

variable "visibility" {
  description = "Is this git repo private"
  type        = string
  default = "public"
}

variable "allow_merge_commit" {
  description = "allow merge commit"
  type        = bool
  default     = true
}

variable "allow_rebase_merge" {
  description = "allow_rebase_merge"
  type        = bool
  default     = true
}

variable "archived" {
  description = "is archived"
  type        = bool
  default     = false
}

variable "delete_branch_on_merge" {
  description = "delete_branch_on_merge"
  type        = bool
  default     = true
}

variable "description" {
  description = "repo description"
  type        = string
}

variable "has_downloads" {
  description = "can download releases"
  type        = bool
  default     = true
}

variable "has_issues" {
  description = "issue reporting"
  type        = bool
  default     = true
}

variable "has_projects" {
  description = "project management tools"
  type        = bool
  default     = true
}
variable "has_wiki" {
  description = "wiki"
  type        = bool
  default     = true
}

variable "vulnerability_alerts" {
  description = "vulnerability_alerts"
  type        = bool
  default     = true
}