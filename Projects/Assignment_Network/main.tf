provider "aws" {
  region = "ap-south-1"
}

module "vpc_complete" {
  source = "./module/ec2Module"
}