terraform {
  required_providers {
    aws = {
      version = "~> 5.41.0"
    }
  }
}
provider "aws" {
  region = "ap-south-1"
  #profile = var.profile_name    # Access/Secret Key rereferred from ~/.aws/credentials #
  alias = "mumbai"
}
provider "aws" {
  alias  = "virginia"               # Alias name for reference #
  region = "us-east-1"
  #profile = var.profile_name
}
