#S3 bucket will be created before ec2 instance
# terraform destroy will first destroy the ec2 instance and then S3
# if terraform destroy -

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