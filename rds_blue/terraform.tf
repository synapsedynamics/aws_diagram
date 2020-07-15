locals {
  base       = data.terraform_remote_state.base.outputs
  subnet_ids = data.terraform_remote_state.subnet_ids.outputs
  rds        = data.terraform_remote_state.base.outputs.rds_blue
  rds_login  = data.terraform_remote_state.base.outputs.rds_blue_login
  # List of security_group_ids to associate with rds instance.
  rds_security_group_ids = data.terraform_remote_state.base.security_group_ids.rds_blue

}
terraform {
  required_version = "~> 0.12"

  #  backend "s3" {
  #    bucket = "62321a-AREM-terraform--de-dust2"
  #    key    = "rds_blue/"
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

