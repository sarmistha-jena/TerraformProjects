/*module "vpc" {
  source = "../vpcModule"
}*/

resource "aws_internet_gateway" "gw" {
  vpc_id = var.vpcid
  tags   = {
    Name = "TF-IGW"
  }
}