# Terraformの設定
terraform {
  required_version = ">= 0.12"

  backend "s3" {
    encrypt        = true
    bucket         = "tf-cicd-ecr"
    dynamodb_table = "tf-state-lock"
    key            = "terraform.tfstate"
    region         = "ap-northeast-1"
  }
}

# AWS プロバイダの設定
provider "aws" {
  region = "ap-northeast-1"
}

