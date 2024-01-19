provider "aws" {
  region = "ap-south-1"
}

variable "userNames" {
  description = "List of names to be created"
  type        = list(string)
  default     = ["user1", "user2", "user3", "user4", "user5"]
}

resource "aws_iam_user" "users" {
  count = length(var.userNames)
  name  = var.userNames[count.index]
}