module "vpc" {
  source = "../vpcModule"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = module.vpc.vpcid
  tags   = {
    Name = "TF-IGW"
  }
}