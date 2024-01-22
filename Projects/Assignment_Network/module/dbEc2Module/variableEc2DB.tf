variable "type" {
  default = "t2.micro"
}

variable "keyName" {
  default = "linux-pract1"
}

variable subnets {
  type        = list(string)
  description = "valid subnets to assign to server"
}