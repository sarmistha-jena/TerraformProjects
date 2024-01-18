provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example1" {
  ami           = "ami-08e5424edfe926b43"
  instance_type = "t2.micro"
  tags          = {
    Name = "TF instance"
  }
}

resource "aws_eip" "lb" {
  instance = aws_instance.example1.id
}
