terraform {
  backend "s3" {
    bucket = "my-tf-test-bucket-backend"
    key    = "elbAssignment/terraform.tfstate" # path & file which will hold the state #
    region = "ap-south-1"
    #dynamodb_table = "terraform-lock"
    #encrypt        = "true"
  }
}