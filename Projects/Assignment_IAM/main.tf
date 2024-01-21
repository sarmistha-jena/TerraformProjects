module "iam_qa_user" {
  source = "./modules/UserIAM"
  qauser = "1"
  userName = "testUser1"
}
/*
module "iam_dev_user" {
  source = "./modules/UserIAM"
  qauser = "1"
  userName = "devUser1"
}*/
