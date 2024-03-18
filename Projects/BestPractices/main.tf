resource "aws_instance" "bestpractmum" {
  provider = aws.mumbai
  ami = "ami-08e5424edfe926b43"
  instance_type = "t2.micro"
  tags = {
    Name ="Mumbai"
  }
  provisioner "local-exec" {
    command = "exit 1"
    on_failure = continue
  }
}

resource "aws_instance" "bestpractus" {
  provider = aws.virginia
  ami = "ami-080e1f13689e07408"
  instance_type = "t2.micro"
  tags = {
    Name ="USA"
  }
}