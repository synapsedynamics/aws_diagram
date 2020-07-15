locals {
  base    = data.terraform_remote_state.base.outputs
  sg_ids  = data.terraform_remote_state.data_security_groups.outputs.sg_ids
}

output sg_ids {
  value = local.sg_ids
}

terraform {
  required_version = "~> 0.12"

  #  backend "s3" {
  #    bucket = "62321a-AREM-terraform--de-dust2"
  #    key    = "security_group_rules/"
  #    region = "Which ever region is in SwitchNAP"
  #  }
}

provider "aws" {
  version    = "~> 2.0"
  region     = local.base.aws_region
  access_key = "__accesskey__"
  secret_key = "__secretkey__"
}

data "terraform_remote_state" "base" {
  backend = "local"
  config = {
    path = "../terraform.tfstate"
  }
}

data "terraform_remote_state" "data_security_groups" {
  backend = "local"
  config = {
    path = "../data.security_groups/terraform.tfstate"
  }
}

