variable "public_subnet_numbers" {
  //type = map(number)

  description = "Map of AZ to a number that should be used for public subnets"
  default     = "ap-south-1a"
  /*default = {
    "ap-south-1a" = 1
    "ap-south-1b" = 2
    "ap-south-1c" = 3
  }*/
}

variable "private_subnet_numbers" {
  //type = map(number)

  description = "Map of AZ to a number that should be used for private subnets"
  default     = "ap-south-1b"
  /*default = {
    "ap-south-1a" = 4
    "ap-south-1b" = 5
    "ap-south-1c" = 6
  }*/
}
variable "vpcid" {}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}