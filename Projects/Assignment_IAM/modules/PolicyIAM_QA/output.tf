output "policy" {
  value = aws_iam_policy.qaPolicy.policy
  description = "`policy` exported from `aws_iam_policy`"
}