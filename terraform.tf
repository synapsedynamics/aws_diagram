terraform {
  required_version = "~> 0.12"

  #  backend "s3" {
  #    bucket = "62321a-AREM-terraform--de-dust2"
  #    key    = ""
  #    region = "Which ever region is in SwitchNAP"
  #  }
}

provider "aws" {
  version    = "~> 2.0"
  region     = var.environment.region
  access_key = "__accesskey__"
  secret_key = "__secretkey__"
}

resource "random_id" "random_hash_suffix_environment" {
  byte_length = 4
}
locals {
  environment = "${var.environment.name}-${random_id.random_hash_suffix_environment.hex}"
}
