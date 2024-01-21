provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c1a7f89451184c8b"
  instance_type = "t2.micro"
  key_name      = "linux-pract1"

  provisioner "local-exec" {
    command    = "echo 'while true; do echo hi-students; sleep 5; done' > myscript.sh"
  }

  provisioner "file" {
    source      = "myscript.sh"
    destination = "/tmp/myscript.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/myscript.sh",
      "nohup /tmp/myscript.sh 2>&1 &",
    ]
  }

  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("linux-pract1.pem")
    host     = self.public_ip
  }
}
