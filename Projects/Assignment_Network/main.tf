provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "./module/vpcModule"
}

module "subnets" {
  source = "./module/subnetModule"
  vpcid = module.vpc.vpcid
}

module "igw" {
  source = "./module/internetGatewayModule"
  vpcid = module.vpc.vpcid
}
/*

*/
/*module "subnet" {
  source = "./module/subnetModule"
}*//*

module "vpc_complete-web" {
  source = "./module/ec2Module"
  //subnets = keys(module.subnet.publicSubnetId)
}
module "vpc_complete-db" {
  source = "./module/dbEc2Module"
  //subnets = keys(module.subnet.privateSubnetId)
}*/
