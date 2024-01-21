provider "aws" {
  region = "ap-south-1"
}
module "PolicyIAM_DEV" {
  source = "../PolicyIAM_DEV"
}
module "PolicyIAM_QA" {
  source = "../PolicyIAM_QA"
}
resource "aws_iam_user" "demo" {
  //name = var.userName
  for_each = var.userName
  name = each.value
  path = var.path
  force_destroy = var.force_destroy
  tags = {
    "testuser" = each.value
  }
}

resource "aws_iam_access_key" "demo" {
  user = aws_iam_user.demo.name
}

resource "aws_iam_user_policy" "demo" {
  policy = var.devuser ? module.PolicyIAM_DEV.policy : module.PolicyIAM_QA.policy
  user   = aws_iam_user.demo.name
}