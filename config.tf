# Terraformの設定
terraform {
  required_version = ">= 0.12"

  backend "s3" {
    bucket = "tf-cicd-ecr"
    key = "example/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

# AWS プロバイダの設定
provider "aws" {
  region = "ap-northeast-1"
}

