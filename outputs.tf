output "environment" {
  value = var.environment
}

output security_group_names {
  value = local.security_group_names
}

#output "security_groups" {
#  value = aws_security_group.security_group
##   value = {
##     "db_reports"       = aws_security_group.db_reports.id
##     "content-manager"  = aws_security_group.content-manager.id
##     "elasticache_blue" = aws_security_group.elasticache_blue.id
##     "morty"            = aws_security_group.morty.id
##     "public_alb"       = aws_security_group.public_alb.id
##     "rds_blue"         = aws_security_group.rds_blue.id
##     "website"          = aws_security_group.website.id
##   }
#}

output security_groups {
  value = var.security_groups
}

# output "sgs" {
#   value = data.aws_security_groups.morty_clients
# }

output "aws_region" {
  value = var.environment.region
}

output "vpc" {
  value = aws_vpc.defaultvpc
}
# 
# output "aws_security_group_alb" {
#   value = aws_security_group.public_alb
# }
# 
# output "aws_security_group_rds_blue" {
#   value = aws_security_group.rds_blue
# }

# output "subnets_public_ids" {
#   value = data.aws_subnet_ids.subnets_public.ids
# }
# 
# output "subnets_private_ids" {
#   value = data.aws_subnet_ids.subnets_private.ids
# }

# output "public_albs" {
#   value = var.public_albs
# }

# output "elasticache_blue" {
#   value = {
#     "name" = local.blue-instance
#     "vars" = var.elasticache_blue
#   }
# }

output "rds_blue_login" {
  sensitive = true
  value = {
    "username" = var.rds_blue_login.username
    "password" = var.rds_blue_login.password
  }
}

output "rds_blue" {
  value = var.rds_blue
}

# Internal LB
output "internal_lb" {
  value = var.internal_lb
}
# #
