provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example1" {
  ami           = "ami-08e5424edfe926b43"
  instance_type = "t2.micro"

  tags = {
    Name = "TF instance"
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.example1.private_ip} >> private_ips.txt"
    command = "echo The server's IP address is ${self.private_ip}"
  }
  provisioner "local-exec" {
    when    = destroy
    command = "rm private_ips.txt"
  }
}

