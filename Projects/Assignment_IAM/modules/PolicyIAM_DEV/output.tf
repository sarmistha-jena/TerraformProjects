output "policy" {
  value = aws_iam_policy.devPolicy.policy
  description = "`policy` exported from `aws_iam_policy`"
}