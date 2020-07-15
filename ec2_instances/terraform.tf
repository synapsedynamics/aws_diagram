locals {
  base       = data.terraform_remote_state.base.outputs
  sites      = data.terraform_remote_state.sites.outputs.sites
  subnet_ids = data.terraform_remote_state.subnet_ids.outputs
  sg_ids = data.terraform_remote_state.data_security_groups.outputs.sg_ids
}

terraform {
  required_version = "~> 0.12"

  #  backend "s3" {
  #    bucket = "62321a-AREM-terraform--de-dust2"
  #    key    = "ec2_instances/"
  #    region = "__awsregion__"
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

data "terraform_remote_state" "sites" {
  backend = "local"
  config = {
    path = "../public_albs/terraform.tfstate"
  }
}
data "terraform_remote_state" "subnet_ids" {
  backend = "local"
  config = {
    path = "../data.subnet_ids/terraform.tfstate"
  }
}
data "terraform_remote_state" "data_security_groups" {
  backend = "local"
  config = {
    path = "../data.security_groups/terraform.tfstate"
  }
}
