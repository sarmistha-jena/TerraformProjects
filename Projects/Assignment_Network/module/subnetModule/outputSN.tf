output "publicSubnetId" {
  value = aws_subnet.public_subnet.*.id[0]
}

output "privateSubnetId" {
  value = aws_subnet.private_subnet.*.id[1]
}