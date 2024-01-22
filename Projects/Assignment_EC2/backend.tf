terraform {
  backend "s3" {
    bucket = "my-tf-test-bucket-backend"
    key    = "ec2Assignment/terraform.tfstate" # path & file which will hold the state #
    region = "ap-south-1"
    #dynamodb_table = "terraform-lock"
    #encrypt        = "true"
  }
}