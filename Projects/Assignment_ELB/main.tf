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

module "igw" {
  source = "./module/internetGatewayModule"
  vpcid  = module.vpc.vpcid
}

module "routeTable" {
  source                   = "./module/routeTableModule"
  igwId                    = module.igw.igwId
  vpcid                    = module.vpc.vpcid
  publicSubnetId           = module.subnets.publicSubnetId
}

module "elb" {
  source      = "./module/elbModule"
  sgElb       = module.securityGroup.sgElb
  elb_port    = var.elb_port
  server_port = var.server_port
  subnetId    = module.subnets.publicSubnetId
}

module "asg" {
  source      = "./module/asgModule"
  elbName     = module.elb.elbName
  server_port = var.server_port
  sgServer    = module.securityGroup.sgElbInstance
  subnetId    = module.subnets.publicSubnetId
  type        = var.type
}