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

module "igw" {
  source = "./module/internetGatewayModule"
  vpcid  = module.vpc.vpcid
}

module "securityGroup" {
  source = "./module/securityGroupModule"
  vpcid  = module.vpc.vpcid
}

module "server" {
  source         = "./module/ec2Module"
  publicSubnetId = module.subnets.publicSubnetId
  sgPub          = module.securityGroup.sgPub
}

module "db" {
  source          = "./module/dbEc2Module"
  privateSubnetId = module.subnets.privateSubnetId
  sgPrivate       = module.securityGroup.sgPrivate
}

module "routeTable" {
  source                   = "./module/routeTableModule"
  igwId                    = module.igw.igwId
  vpcid                    = module.vpc.vpcid
  privateSubnetId          = module.subnets.privateSubnetId
  publicSubnetId           = module.subnets.publicSubnetId
  pubEc2NetworkInterfaceId = module.server.pubEc2NetworkInterfaceId
}
