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
  subnet_id      = var.publicSubnetId.*.id
  route_table_id = aws_route_table.rt_public.id
}
