provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "inst1" {
  ami           = var.amiid
  instance_type = var.type
}