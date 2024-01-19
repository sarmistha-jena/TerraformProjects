provider "aws" {
  region = "ap-south-1"
}

variable "const" {
  default = 0
}

resource "aws_iam_user" "users" {
  count = var.const>0 ?1 : 2
  name  = "exampleUsers2"
}