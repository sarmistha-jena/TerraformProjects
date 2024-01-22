output "publicSubnetId" {
  value = {
  for subnet in aws_subnet.public_subnet :
  subnet.id => subnet.cidr_block
  }
}

output "privateSubnetId" {
  value = {
  for subnet in aws_subnet.private_subnet :
  subnet.id => subnet.cidr_block
  }
}