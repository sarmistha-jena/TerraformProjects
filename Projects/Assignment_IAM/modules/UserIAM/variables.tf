variable "devuser" {
  default = false
  type = bool
  description = "Whether to create dev user"
}

variable "qauser" {
  default = false
  type = bool
  description = "Whether to create qa user"
}

variable "userName" {
  description = "List of names to be created"
  type   = map(string)
  default = {
    "qaUser" = "qa"
    "devUser" = "dev"
  }
  /*type = list(string)
  default = ["demoUserTF", "demoUserM", "dd"]*/
  //type        = list(string)
  //default     = ["user1", "user2", "user3", "user4", "user5"]
}

variable "path" {
  description = "Desired path for the IAM user"
  type = string
  default = "/"
}

variable "force_destroy" {
  description = "Allow force destroy"
  type        = bool
  default     = true
}