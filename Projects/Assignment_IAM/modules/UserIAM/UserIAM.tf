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

  //for_each = toset(var.userName)
  //  name = each.value

  for_each = var.userName
  name = each.key
  path = var.path
  force_destroy = var.force_destroy
  tags = {
    "testuser" = each.value
  }
}

resource "aws_iam_access_key" "demo" {
  //user = aws_iam_user.demo.name
  depends_on = [aws_iam_user.demo]
  count = length(var.userName)
  //user = element(var.userName, count.index)

  user = element(var.userName[key], count.index)
}

resource "aws_iam_user_policy" "demo" {
  depends_on = [aws_iam_user.demo]
  count = length(var.userName)

//  policy = var.devuser ? module.PolicyIAM_DEV.policy : module.PolicyIAM_QA.policy
  //user = aws_iam_user.demo.name

//  user   = element(var.userName, count.index)
  policy = var.userName[value] ? module.PolicyIAM_DEV.policy : module.PolicyIAM_QA.policy
  user   = element(var.userName[key], count.index)
}