provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example1" {
  ami           = "ami-08e5424edfe926b43"
  instance_type = "t2.micro"
  key_name      = "myKey"

  tags = {
    Name = "TF instance"
  }
  provisioner "file" {
    source      = "test.conf"
    destination = "/tmp/myapp.conf"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("myKey.pem")
    host        = self.public_ip
  }
}
