locals {
  name         = "profuture"
  env          = "stg"
  service_name = "survey-hr"

  azs = {
    aza = "ap-northeast-1a"
    azd = "ap-northeast-1d"
  }

  cidr = {
    vpc = "10.0.0.0/16"
  }

  vpn_ip_list = [
    "0.0.0.0/0",
  ]
}