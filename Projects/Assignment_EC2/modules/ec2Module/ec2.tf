provider "aws" {
  region = var.default_region
}
module "amiModule" {
  source = "../amiModule"
}
module "ebsModule" {
  source = "../ebsModule"
}
resource "aws_instance" "example1" {
  ami           = module.amiModule.ami
  instance_type = var.instance_size

  tags = {
    Name = "TF instance module"
  }
}

resource "aws_volume_attachment" "attachment" {
  volume_id   = module.ebsModule.volumeid
  instance_id = aws_instance.example1.id
  device_name = "/dev/sdb"
}

