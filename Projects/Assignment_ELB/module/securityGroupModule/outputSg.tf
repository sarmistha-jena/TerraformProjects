output "sgPub" {
  value = aws_security_group.sgPub.id
}
output "sgPrivate" {
  value = aws_security_group.sgPrivate.id
}
output "sgElb" {
  value = aws_security_group.elb.id
}
output "sgElbInstance" {
  value = aws_security_group.instance.id
}