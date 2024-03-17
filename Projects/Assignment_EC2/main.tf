provider "aws" {
  region = "ap-south-1"
}

module "ec2_complete" {
  source        = "./modules/ec2Module"
  instance_size = "t2.micro"
}
