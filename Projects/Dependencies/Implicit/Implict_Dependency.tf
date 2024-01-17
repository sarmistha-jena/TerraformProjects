provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example1" {
  ami           = "ami-08e5424edfe926b43"
  instance_type = "t2.micro"
  depends_on = [aws_s3_bucket.example]
  tags = {
    Name = "TF instance"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-var1"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}