module "vpc" {
  source = "../vpcModule"
}

module "igw" {
  source = "../internetGatewayModule"
}

module "subnet" {
  source = "../subnetModule"
}
module "ec2" {
  source = "../ec2Module"
}
resource "aws_route_table" "rt_public" {
  vpc_id = module.vpc.vpcid
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.igw.igwId
  }
  tags = {
    Name = "Public route table"
  }
}

resource "aws_route_table_association" "pub-sub-rt" {
  subnet_id      = module.subnet.publicSubnetId[0]
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_route_table" "rt_private" {
  vpc_id = module.vpc.vpcid
  route {
    cidr_block           = "0.0.0.0/0"
    network_interface_id = module.ec2.pubEc2NetworkInterfaceId
  }
  tags = {
    Name = "Private route table"
  }
}

resource "aws_route_table_association" "private-sub-rt" {
  subnet_id      = module.subnet.privateSubnetId[1]
  route_table_id = aws_route_table.rt_private.id
}