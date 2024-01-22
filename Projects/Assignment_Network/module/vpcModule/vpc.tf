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

resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags                 = {
    Name = "Terraform VPC"
  }

}