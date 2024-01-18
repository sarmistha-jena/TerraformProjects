#Data sources allow Terraform to use information defined outside of Terraform,
#defined by another separate Terraform configuration, or modified by functions.

provider "aws" {
  region = "ap-south-1"
}

data "aws_availability_zones" "example" {
  state = "available"
}

data "aws_instances" "test" {
  filter {
    name   = "instance-type"
    values = ["t2.micro", "t2.small"]
  }

  instance_state_names = ["running", "stopped"]
}