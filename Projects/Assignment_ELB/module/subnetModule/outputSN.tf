output "publicSubnetId" {
  /*value = {
  for subnet in aws_subnet.public_subnet :
  subnet.id => subnet.cidr_block
  }*/
  value = aws_subnet.public_subnets-elb[*].id
}
