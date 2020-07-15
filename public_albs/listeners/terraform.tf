locals {
  base             = data.terraform_remote_state.base.outputs
  subnet_ids       = data.terraform_remote_state.subnet_ids.outputs
  sites_lbs        = data.terraform_remote_state.site_lbs.outputs
  sites            = data.terraform_remote_state.sites.outputs.sites
}


terraform {
  required_version = "~> 0.12"

  #  backend "s3" {
  #    bucket = "62321a-AREM-terraform--de-dust2"
  #    key    = "public_albs/listeners/"
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
    path = "../../terraform.tfstate"
  }
}

data "terraform_remote_state" "subnet_ids" {
  backend = "local"
  config = {
    path = "../../data.subnet_ids/terraform.tfstate"
  }
}

# data "terraform_remote_state" "ec2_instance_ids" {
#   backend = "local"
#   config = {
#     path = "../../ec2_instances/data.ec2_instances_ids/terraform.tfstate"
#   }
# }

data "terraform_remote_state" "site_lbs" {
  backend = "local"
  config = {
    path = "../data.site_lbs/terraform.tfstate"
  }
}

data "terraform_remote_state" "sites" {
  backend = "local"
  config = {
    path = "../terraform.tfstate"
  }
}
