provider "aws" {
  region = "ap-south-1"
}

data "aws_iam_policy_document" "demo" {
  statement {
    effect  = "Deny"
    actions = [
      "elasticbeanstalk:CreateEnvironment",
      "elasticbeanstalk:RebuildEnvironment",
      "elasticbeanstalk:TerminateEnvironment"
    ]
    resources = ["*"]
  }
  statement {
    effect    = "Allow"
    actions   = "ec2:RunInstances"
    resources = [
      "arn:aws:ec2:*:637423393571:instance/*",
      "arn:aws:ec2:*:637423393571:subnet/*"
    ]
    condition {
      test   = "StringEquals"
      values = [
        "t2.micro",
        "t2.small"
      ]
      variable = "ec2:InstanceType"
    }
  }
}

resource "aws_iam_policy" "devPolicy" {
  policy = data.aws_iam_policy_document.demo.json
  name = "dev_policy"
  path = "/"
}