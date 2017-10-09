variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
  default = "us-east-1"
}
variable "table_name" {
  default = "AWS-Accounts"
}

variable "aws_iam_role" {
   default = "ddb-role"
}

variable "aws_iam_policyname" {
  default = "ddb-policy"

}

