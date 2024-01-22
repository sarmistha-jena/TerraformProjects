output "pubEc2Id" {
  value = aws_instance.server.id
}

output "pubEc2NetworkInterfaceId" {
  value = aws_instance.server.primary_network_interface_id
}