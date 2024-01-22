module "vpc" {
  source = "../vpcModule"
}

resource "aws_subnet" "public_subnet" {
  vpc_id   = module.vpc.vpcid
  for_each = var.public_subnet_numbers

  availability_zone = each.key
  cidr_block        = cidrsubnet(module.vpc.vpc_cidr, 4, each.value)

  tags = {
    Name   = "Terra-public-subnet"
    Role   = "public"
    Subnet = "${each.key}-${each.value}"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id   = module.vpc.vpcid
  for_each = var.public_subnet_numbers

  availability_zone = each.key
  cidr_block        = cidrsubnet(module.vpc.vpc_cidr, 4, each.value)

  tags = {
    Name   = "Terra-public-subnet"
    Role   = "private"
    Subnet = "${each.key}-${each.value}"
  }
}