output "publicSubnetId" {
  value = aws_subnet.public_subnet.*.id
}

output "privateSubnetId" {
  value = aws_subnet.private_subnet.*.id
}