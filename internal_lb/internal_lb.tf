resource "aws_lb" "internal_lb" {
  name               = local.lb.name
  internal           = true
  load_balancer_type = "network"
  subnets            = local.subnet_ids.subnets_private_ids

  enable_deletion_protection = local.lb.enable_deletion_protection

  # TODO: render tags from variable of type map from var.internal_internal_lb.tags{}
  tags = {
    network_tier = "private"
    environment  = local.base.environment.name
  }
}

