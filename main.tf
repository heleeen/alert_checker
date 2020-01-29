terraform {
  backend "s3" {
    region = "ap-northeast-1"
    key    = "alert_checker.tfstate"
  }
}

provider "aws" {
  region = var.region
}

module "function" {
  source = "git@github.com:heleeen/heleeen_terraform.git//lambda?ref=v0.2"
  name   = var.name
  environments = map(
    "MACKEREL_API_KEY", var.mackerel_api_key,
    "SLACK_WEBHOOK_URL", var.slack_webhook_url
  )
}
