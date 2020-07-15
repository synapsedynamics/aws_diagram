locals {
  security_group_names = [ "content-manager", "db_reports", "elasticache_blue", "morty", "public_alb", "rds_blue", "website" ]
}

variable "security_groups" {
  type = list(object({
    name = string
    ingress_rules = list(object({
      pre_description                 = string
      security_group_source_names = list(string)
      port                        = number
      protocol                    = string
    }))
  }))

  default = [
    {
      name = "content-manager"
      ingress_rules = [{
        pre_description                 = "Allow from public alb"
        security_group_source_names = ["public_alb"]
        port                        = 443
        protocol                    = "tcp"
      }]
    },
    {
      name = "elasticache_blue"
      ingress_rules = [{
        pre_description                 = "Allow"
        security_group_source_names = ["website"]
        port                        = 6379
        protocol                    = "tcp"
      }]
    },
    {
      name = "morty"
      ingress_rules = [
        {
          pre_description                 = "Allow"
          security_group_source_names = ["content-manager", "website"]
          port                        = 443
          protocol                    = "tcp"
        },
        {
          pre_description                 = "Allow"
          security_group_source_names = ["content-manager", "website"]
          port                        = 8444
          protocol                    = "tcp"
        },
        {
          pre_description                 = "Allow"
          security_group_source_names = ["content-manager", "website"]
          port                        = 8448
          protocol                    = "tcp"
        },
        {
          pre_description                 = "Allow"
          security_group_source_names = ["content-manager", "website"]
          port                        = 8984
          protocol                    = "tcp"
        }
      ]
    },
    {
      name = "rds_blue"
      ingress_rules = [{
        pre_description                 = "Allow SQL"
        security_group_source_names = ["db_reports", "content-manager", "morty", "website"]
        port                        = 1433
        protocol                    = "tcp"
      }]
    },
    {
      name = "website"
      ingress_rules = [{
        pre_description                 = "Allow from public alb"
        security_group_source_names = ["public_alb"]
        port                        = 443
        protocol                    = "tcp"
      }]
    },
  ]
}
