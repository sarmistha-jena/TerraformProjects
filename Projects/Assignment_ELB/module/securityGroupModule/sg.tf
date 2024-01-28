resource "aws_security_group" "sgPub" {
  vpc_id = var.vpcid
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
  tags = {
    Name = "TF Public SG"
  }
}

resource "aws_security_group" "sgPrivate" {
  vpc_id = var.vpcid
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
    from_port       = 3306
    protocol        = "tcp"
    to_port         = 3306
    security_groups = [aws_security_group.sgPub.id]
  }
  tags = {
    Name = "TF Private SG"
  }
}

resource "aws_security_group" "elb" {
  name = "sara-demo-elb"
  vpc_id = var.vpcid
  # Allow all outbound (-1)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound HTTP from anywhere
  ingress {
    from_port   = var.elb_port
    to_port     = var.elb_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "instance" {
  name = "sara-demo-instance-elb"
  vpc_id = var.vpcid
  # Inbound HTTP from anywhere
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
