terraform {
  backend "s3" {
    bucket         = "my-tf-test-bucket-backend"
    key            = "assignment1/terraform.tfstate" # path & file which will hold the state #
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example1" {
  ami           = "ami-0a7cf821b91bcccbc"
  instance_type = "t2.micro"

  tags = {
    Name = "TF instance assignment-1"
  }
}

}