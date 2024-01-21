module "iam_qa_user" {
  source = "./modules/UserIAM"
  qauser = "1"
  userName = var.userName
}
/*
module "iam_dev_user" {
  source = "./modules/UserIAM"
  qauser = "1"
  userName = "devUser1"
}*/
variable "userName" {
  description = "List of names to be created"
  type   = map(string)
  default = {
    "qaUser" = "qa"
    "devUser" = "dev"
  }
}