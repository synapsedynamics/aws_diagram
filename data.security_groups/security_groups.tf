locals {
  sets = [ "ec2_aws_dns", "elasticache_blue_client", "morty_client", "rds_blue_client" ]
}

data "aws_security_groups" "sets" {
for_each = toset(local.sets)

    tags = {
      (each.value) = "true"
    }
}

output sets {
  value = data.aws_security_groups.sets
}
