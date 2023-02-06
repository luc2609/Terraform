terraform {
  required_version = "~>1.3.0"

required_providers {
    aws = {
      version = "~>4.28"
      source  = "hashicorp/aws"
    }

    newrelic = {
      source  = "newrelic/newrelic"
      version = "~>3.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"

  default_tags {
    tags = {
      ServiceName = local.service_name
      Env         = local.env
    }
  }
}
