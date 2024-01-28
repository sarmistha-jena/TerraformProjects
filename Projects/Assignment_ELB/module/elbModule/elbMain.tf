data "aws_availability_zones" "all" {}

resource "aws_elb" "loadBalancer" {
  name               = "sara-elb-demo"
  security_groups    = [var.sgElb]
  availability_zones = data.aws_availability_zones.all.names

  health_check {
    healthy_threshold   = 2
    interval            = 30
    target              = "HTTP:${var.server_port}"
    timeout             = 3
    unhealthy_threshold = 3
  }

  listener {
    instance_port     = var.server_port
    instance_protocol = "http"
    lb_port           = var.elb_port
    lb_protocol       = "http"
  }
}
