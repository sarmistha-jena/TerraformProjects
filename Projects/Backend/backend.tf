# Backend defines where Terraform stores its state file.

terraform {
  backend "s3" {
       bucket = "my-tf-test-bucket-backend"
       key = "default/terraform.tfstate" # path & file which will hold the state #
       region = "ap-south-1"
    }
}
