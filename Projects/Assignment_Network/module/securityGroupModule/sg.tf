module "vpc" {
  source = "../vpcModule"
}

resource "aws_security_group" "sgPub" {
  vpc_id = module.vpc.vpcid
  egress {
    from_port   = 0
    protocol    = "-1" #allow all traffic
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    protocol    = "tcp"
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sgPrivate" {
  vpc_id = module.vpc.vpcid
  egress {
    from_port   = 0
    protocol    = "-1" #allow all traffic
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    protocol    = "tcp"
    to_port     = 3306
    cidr_blocks = [aws_security_group.sgPub.id]
  }
}