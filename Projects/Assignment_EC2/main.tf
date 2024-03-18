provider "aws" {
  region = "ap-south-1"
}

module "ec2_complete" {
  source        = "./modules/ec2Module"
  instance_size = "t2.micro"
}

--------- using module fron github------------------
provider "aws" {
  region = "ap-south-1"
}
module "ec2_complete" {
  source        = "github.com/sarmistha-jena/TerraformProjects.git//Projects/Assignment_EC2/modules/ec2Module?ref=master"
  instance_size = "t2.micro"
}
