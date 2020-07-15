# Environment name must contain only lowercase alphanumeric characters and hyphens.
variable "environment" {
  description = "Name of the environment instance, examples: [ dev, test-featurebranch, de-dust2, cs-office, test, stage-blue, stage-green ]"
  type = object({
    name         = string
    end_customer = string
    cidr_block = string
    region = string
  })
  default = {
    name         = "de-dust"
    end_customer = "crisprAccelerate"
    cidr_block = "10.20.0.0/16"
    region = "__awsregion__"
  }
}

variable "public_subnets__map_public_ip_on_launch" {
  type    = bool
  default = true
}

# This load balancer intentionally separate.
variable "internal_lb" {
  type = object({
    name                       = string
    description                = string
    enable_deletion_protection = bool
    access_logs_enabled        = bool
    #    tags = object({
    #      primary-FQDN = string
    #    })
  })

  default = {
    name                       = "elb-1"
    description                = "named after internal elb in diagram"
    enable_deletion_protection = false
    access_logs_enabled        = true
    #      tags = {
    #        primary-FQDN = "content-manager.com"
    #      }

  }
}
