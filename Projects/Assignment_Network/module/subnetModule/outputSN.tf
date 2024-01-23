output "publicSubnetId" {
  /*value = {
  for subnet in aws_subnet.public_subnet :
  subnet.id => subnet.cidr_block
  }*/
  value = aws_subnet.public_subnet.id
}

output "privateSubnetId" {
  /*value = {
  for subnet in aws_subnet.private_subnet :
  subnet.id => subnet.cidr_block
  }*/
  value = aws_subnet.private_subnet.id
}