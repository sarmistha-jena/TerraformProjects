provider "aws" {
  region = "ap-south-1"
}

resource "aws_dynamodb_table" "dynamodb-terraform-lock" {
  name           = "terraform-lock"
  hash_key       = "LockID"
  read_capacity  = 1
  write_capacity = 1

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Terraform Lock Table"
  }
}
resource "aws_s3_bucket" "tf_remote_state" {
  bucket = "terraform-state-demo-002"
  /*lifecycle {
    prevent_destroy = true
  }*/
}
  resource "aws_s3_bucket_versioning" "versioning_example" {
    bucket = aws_s3_bucket.tf_remote_state.id
    versioning_configuration {
      status = "Enabled"
    }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "encypt_demo" {
  bucket = aws_s3_bucket.tf_remote_state.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}