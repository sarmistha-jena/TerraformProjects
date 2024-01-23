module "amiModule" {
  source = "../amiModule"
}


data "aws_availability_zones" "example" {
  state = "available"
}

/*resource "random_shuffle" "subnets" {
  input        = var.subnets
  result_count = 1
}*/

resource "aws_instance" "database" {
  ami                    = module.amiModule.ami
  instance_type          = var.type
  key_name               = var.keyName
  vpc_security_group_ids = [var.sgPrivate]
  //subnet_id              = random_shuffle.subnets.result[0]
  subnet_id              = var.privateSubnetId
  availability_zone      = data.aws_availability_zones.example.names[1]

  associate_public_ip_address = true
  tags                        = {
    Name = "TF DB server"
  }
}
