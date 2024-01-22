terraform {
  required_providers {
    aws = {
      source  = "hasicorp/aws"
      version = "~> 1.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "vpc_complete" {
  source = "./module/ec2Module"
}