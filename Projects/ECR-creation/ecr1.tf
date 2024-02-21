provider "aws" {
  region = "ap-south-1"
}

resource "aws_ecr_repository" "apprepo" {
  name = "saraappimage"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}
resource "aws_ecr_repository" "baserepo" {
  name = "sarabaseimage"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}