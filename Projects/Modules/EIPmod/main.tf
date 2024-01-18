provider "aws" {
  region = "ap-south-1"
}

resource "aws_eip" "eip1" {
  instance = var.instanceid
}