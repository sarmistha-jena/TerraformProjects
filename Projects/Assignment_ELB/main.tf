provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "./module/vpcModule"
}

module "subnets" {
  source = "./module/subnetModule"
  vpcid  = module.vpc.vpcid
}

module "securityGroup" {
  source = "./module/securityGroupModule"
  vpcid  = module.vpc.vpcid
}

module "elb" {
  source      = "./module/elbModule"
  sgElb       = module.securityGroup.sgElb
  elb_port    = "80"
  server_port = "8080"
}
module "asg" {
  source      = "./module/asgModule"
  elbName     = module.elb.elbName
  server_port = "8080"
  sgServer    = module.securityGroup.sgElbInstance
  subnetId    = module.subnets.publicSubnetId
  type        = "t3.micro"
}