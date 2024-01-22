provider "aws" {
  region = "ap-south-1"
}

data "aws_availability_zones" "example" {
  state = "available"
}

resource "aws_ebs_volume" "volume" {
  size              = 10
  type              = "gp3"
  availability_zone = data.aws_availability_zones.example.names[0]
}
output "volumeid" {
  value = aws_ebs_volume.volume.id
}