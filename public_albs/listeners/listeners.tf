resource "aws_lb_listener" "site" {
  for_each          = local.sites
  load_balancer_arn = local.sites_lbs.lb_arn[each.value.name]
  port              = each.value.lb.port_listen_lb
  protocol          = "HTTPS"
  # Set the cryptography to 11
  ssl_policy = "ELBSecurityPolicy-FS-1-2-Res-2019-08"
  # Certificate ARN is stored in local, certificate was manually imported in lieu
  # of certificate validation ; certificate is self-signed for demo
  certificate_arn = each.value.cert_arn
  # Normal certificate_arn value 
  #  certificate_arn = aws_acm_certificate.sites[each.key].arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.site[each.value.name].arn
  }
}

resource "aws_lb_target_group" "site" {
  for_each                      = local.sites
  vpc_id                        = local.base.vpc.id
  name                          = each.value.name
  port                          = each.value.lb.port_listen_ec2
  protocol                      = each.value.lb.protocol
  load_balancing_algorithm_type = each.value.lb.algorithm_type
  # The stickiness type is opinionated.
  stickiness {
    enabled = each.value.lb.stickiness
    type    = "lb_cookie"
    # 1800 seconds = a half hour
    cookie_duration = each.value.lb.cookie_duration
  }
  # These health_check settings are arbitrary.
  health_check {
    protocol            = each.value.lb.health_check.protocol
    interval            = each.value.lb.health_check.interval
    timeout             = each.value.lb.health_check.timeout
    path                = each.value.lb.health_check.path
    healthy_threshold   = each.value.lb.health_check.healthy_threshold
    unhealthy_threshold = each.value.lb.health_check.unhealthy_threshold
    matcher             = each.value.lb.health_check.matcher
  }
}

# Make a list of maps that look like:
#   { "site-name" = "content-manager",  "id" = "i-0e7ef15fc2a922e86" },
#   { "site-name" = "website",          "id" = "i-09939d745d468ac9d" }
locals {
  site_instance_ids = flatten([
    for site_key, site in local.sites : [
#    for site in local.sites : [
      for ec2_id, id in site.instances.ids[*] : {
#      for id in site.instances.ids[*] : {
        site_name = site_key
        port = site.lb.port_listen_ec2
        id = id
      }
    ]
  ])
}

resource "aws_lb_target_group_attachment" "site" {
  for_each = {
    for ec2_instance in local.site_instance_ids: ec2_instance.id => ec2_instance
  }
    target_group_arn = aws_lb_target_group.site[each.value.site_name].arn
    target_id        = each.value.id
    port             = each.value.port
}
