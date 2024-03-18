module "amiModule" {
  source = "../amiModule"
}
module "ebsModule" {
  source = "../ebsModule"
}
data "aws_availability_zones" "example" {
  state = "available"
}
resource "aws_instance" "example1" {
  ami               = module.amiModule.ami
  instance_type     = var.instance_size
  availability_zone = data.aws_availability_zones.example.names[0]
  tags              = {
    Name = "TF instance module"
  }
}

resource "aws_volume_attachment" "attachment" {
  volume_id   = module.ebsModule.volumeid
  instance_id = aws_instance.example1.id
  device_name = "/dev/sdf"
}

