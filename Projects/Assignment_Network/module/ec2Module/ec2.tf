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

resource "aws_instance" "server" {
  ami                    = module.amiModule.ami
  instance_type          = var.type
  key_name               = var.keyName
  vpc_security_group_ids = [var.sgPub]
  //subnet_id              = random_shuffle.subnets.result[0]
  subnet_id              = var.publicSubnetId
  availability_zone      = data.aws_availability_zones.example.names[0]

  associate_public_ip_address = true
  user_data                   = <<-EOF
#!/bin/bash
echo '<html><body><h1 style="font-size:50px;color:blue;">Sarmistha <br> <font style="color:red;"> www.myweb.com <br> <font style="color:green;"> Learn Devops </h1> </body></html>' > index.html
nohup busybox httpd -f -p 8080 &
EOF
  tags                        = {
    Name = "TF Web server"
  }
}
