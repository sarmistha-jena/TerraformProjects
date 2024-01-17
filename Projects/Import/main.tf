#terraform import <resource name> <resource id>
#terraform import aws_instance.example2 i-075f0c2681a91c883
#This to be done before terraform apply


provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example1" {
  ami           = "ami-08e5424edfe926b43"
  instance_type = "t2.micro"

  tags = {
    Name = "TF instance1"
  }
}
resource "aws_instance" "example2" {
  ami           = "ami-08e5424edfe926b43"
  instance_type = "t2.micro"

  tags = {
    Name = "TF instance2"
  }
}
