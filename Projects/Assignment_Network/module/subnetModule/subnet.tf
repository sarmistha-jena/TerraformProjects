module "vpc" {
  source = "../vpcModule"
}

resource "aws_subnet" "public_subnet" {
  vpc_id = module.vpc.vpcid
  /*for_each = var.public_subnet_numbers

  availability_zone = each.key
  cidr_block        = cidrsubnet(module.vpc.vpc_cidr, 4, each.value)*/
  availability_zone = var.public_subnet_numbers
  cidr_block        = "12.0.32.0/20"
  tags              = {
    Name   = "Terra-public-subnet"
    Role   = "public"
    //Subnet = "${each.key}-${each.value}"
    Subnet = "Public Subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = module.vpc.vpcid
  /* for_each = var.private_subnet_numbers

   availability_zone = each.key
   cidr_block        = cidrsubnet(module.vpc.vpc_cidr, 4, each.value)
 */
  availability_zone = var.private_subnet_numbers
  cidr_block        = "12.0.16.0/20"
  tags              = {
    Name   = "Terra-private-subnet"
    Role   = "private"
    Subnet = "Private Subnet"
  }
}