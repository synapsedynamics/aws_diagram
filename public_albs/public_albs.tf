# Note: aws_alb is known as aws_lb. The functionality is identical.
resource "aws_lb" "sites" {
  for_each = local.sites
  #   for_each = {
  # # __fix__
  #     for albs in local.base.public_albs : albs.name => albs
  #   }
  name               = each.key
  internal           = false
  load_balancer_type = "application"
  # __fix   alb should be plural
  security_groups = [local.base.security_groups.public_alb]
  subnets         = local.subnet_ids.public

  enable_deletion_protection = each.value.lb.enable_deletion_protection

  access_logs {
    enabled = each.value.lb.access_logs
    bucket  = "${local.base.environment.name}-lb-access-logs--${each.value.name}"
    prefix  = "${local.base.environment.name}-${each.value.name}"
  }

  tags = {
    primary-FQDN = each.value.common_name
    environment  = local.base.environment.name
  }
}

resource "aws_s3_bucket" "lbs" {
  # __fix__
  #  for_each = {
  #    for alb in local.base.public_albs : alb.name => alb
  #  }
  for_each = local.sites
  bucket   = "${local.base.environment.name}-lb-access-logs--${each.value.name}"
  acl      = "private"
  tags = {
    environment = local.base.environment.name
    purpose     = "public_alb_access_logs"
  }
}
