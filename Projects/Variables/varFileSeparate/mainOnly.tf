variable "amiId" {
  //default = "ami-0a7cf821b91bcccbc"
}

variable "amiIdList" {
  type = list(string)
  //default = ["ami-0c6615d1e95c98aca", "ami-0c1a7f89451184c8b"]
}

variable "amiIdMap" {
  type = map(string)
  /*values = {
    "centos"="ami-0c6615d1e95c98aca"
    "ubuntu"="ami-0c1a7f89451184c8b"
  }*/
}

variable "keyForMap" {
  default = "centos"
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "pc1" {
  ami           = var.amiId
  instance_type = "t2.micro"

  tags = {
    Name = "TF PC-1"
  }
}

resource "aws_instance" "pc2" {
  ami           = var.amiIdList[0]
  instance_type = "t2.micro"

  tags = {
    Name = "TF PC-2-List"
  }
}

resource "aws_instance" "pc3" {
  ami           = var.amiIdMap[var.keyForMap]
  instance_type = "t2.micro"

  tags = {
    Name = "TF PC-3-Map"
  }
}