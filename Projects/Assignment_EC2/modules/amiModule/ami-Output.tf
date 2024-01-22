output "ami" {
  value       = data.aws_ami.linux.id
  description = "ami id"
}