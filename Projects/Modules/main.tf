provider "aws" {
  region = "ap-south-1"
}

module "instance" {
  source = "../Modules/EC2mod"
  amiid  = var.instance_amiid
  type   = var.instance_type
}

module "eip" {
  source     = "../Modules/EIPmod"
  instanceid = module.instance.instanceid
}