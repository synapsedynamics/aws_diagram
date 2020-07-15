locals {
  base       = data.terraform_remote_state.base.outputs
  subnet_ids = data.terraform_remote_state.subnet_ids.outputs
  ec         = data.terraform_remote_state.base.outputs.elasticache_blue
  # List of security_group_ids to associate with elasticache 
  security_group_ids = data.terraform_remote_state.base.outputs.security_group_ids.elasticache_blue
}

terraform {
  required_version = "~> 0.12"

  #  backend "s3" {
  #    bucket = "62321a-AREM-terraform--de-dust2"
  #    key    = "elasticache_blue/"
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

data "terraform_remote_state" "subnet_ids" {
  backend = "local"
  config = {
    path = "../data_subnet_ids/terraform.tfstate"
  }
}
