provider "aws" {
  region = "ap-south-1"
}

data "aws_availability_zones" "example" {
  state = "available"
}

output "azlist" {
  value = data.aws_availability_zones.example.names
}