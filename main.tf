terraform {
  backend "s3" {
    region = "ap-northeast-1"
    key    = "alert_checker.tfstate"
  }
}

provider "aws" {
  region = var.region
}

module "iam" {
  source = "./terraform/iam"
}

module "function" {
  source            = "./terraform/function"
  name              = var.name
  mackerel_api_key  = var.mackerel_api_key
  slack_webhook_url = var.slack_webhook_url
  role_arn          = module.iam.role_arn
}
