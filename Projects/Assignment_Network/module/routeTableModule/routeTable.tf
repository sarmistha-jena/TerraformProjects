resource "aws_route_table" "rt_public" {
  vpc_id = var.vpcid
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igwId
  }
  tags = {
    Name = "Public route table"
  }
}

resource "aws_route_table_association" "pub-sub-rt" {
  subnet_id      = var.publicSubnetId
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_route_table" "rt_private" {
  vpc_id = var.vpcid
  route {
    cidr_block           = "0.0.0.0/0"
    network_interface_id = var.pubEc2NetworkInterfaceId
  }
  tags = {
    Name = "Private route table"
  }
}

resource "aws_route_table_association" "private-sub-rt" {
  subnet_id      = var.privateSubnetId
  route_table_id = aws_route_table.rt_private.id
}