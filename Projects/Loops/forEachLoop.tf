variable "userNames2" {
  description = "List of names to be created"
  type        = list(string)
  default     = ["user6", "user7", "user8", "user9", "user10"]
}

resource "aws_iam_user" "users2" {
  for_each = toset(var.userNames2)
  name     = each.value
}