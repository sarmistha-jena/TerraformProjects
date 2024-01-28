data "aws_availability_zones" "all" {}

resource "aws_subnet" "public_subnets-elb" {
  count             = length(data.aws_availability_zones.all.names)
  availability_zone = element(data.aws_availability_zones.all.names, count.index)
  //count      = length(var.public_subnet_cidrs)
  vpc_id            = var.vpcid
  cidr_block        = element(var.public_subnet_cidrs, count.index)

  tags = {
    Name = "ELB-ASG Public Subnet ${count.index + 1}"
  }
}
