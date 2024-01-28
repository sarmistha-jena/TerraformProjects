module "amiModule" {
  source = "../amiModule"
}

data "aws_availability_zones" "all" {}

resource "aws_launch_configuration" "demo" {
  name            = "sara-demo-launchconfig"
  image_id        = module.amiModule.ami
  instance_type   = var.type
  security_groups = [var.sgServer]

  user_data = <<-EOF
              #!/bin/bash
              echo '<html><body><h1 style="font-size:50px;color:blue;">DEMO ELB TERRAFORM PROJECT <br> <font style="color:red;"> Learning Terraform <br> <font style="color:green;"> Sarmistha </h1> </body></html>' > index.html
              nohup busybox httpd -f -p "${var.server_port}" &
              EOF

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "demo_asg" {
  name                   = "sara-demo-asg"
  launch_configuration   = aws_launch_configuration.demo.id
  //availability_zones = [data.aws_availability_zones.all.names]
  max_size               = 10
  min_size               = 2
  load_balancers         = [var.elbName]
  health_check_type      = "ELB"
  vpc_zone_identifier    = var.subnetId.*.id
  tag {
    key                 = "Name"
    value               = "SARA-ASG-PROJECT"
    propagate_at_launch = true
  }
}