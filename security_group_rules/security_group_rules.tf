# For each combination of security_group, port, and source_security_group_id,
# make a map like below
#   {
#     "new_desc" = "Allow SQL tcp/1433 from db_reports"
#     "port" = 1433
#     "protocol" = "tcp"
#     "rule" = "rds_blue.1433.db_reports"
#     "security_group_id" = "sg-0f54b40ccbcbcf494"
#     "sg_source" = "sg-098a50890e379a644"
#   }
locals {
  ing_rule__and__sg_source = flatten([
    for security_group__key, security_group in var.security_groups : [
      for ing_rules__key, ing_rule in security_group.ingress_rules[*] : [
        for sg_source__key, sg_source in ing_rule.security_group_source_names[*] : {
          rule              = "${security_group.name}.${ing_rule.port}.${sg_source}"
          new_desc          = "${ing_rule.description} ${ing_rule.protocol}/${ing_rule.port} from ${sg_source}"
          protocol          = ing_rule.protocol
          port              = ing_rule.port
          security_group_id = element(matchkeys(values(local.sg_ids), keys(local.sg_ids), [security_group.name]), 1)
          sg_source         = element(matchkeys(values(local.sg_ids), keys(local.sg_ids), [sg_source]), 1)
        }
      ]
    ]
  ])
}

resource "aws_security_group_rule" "sg_rule" {
  for_each = {
    for sg_rule in local.ing_rule__and__sg_source : "${sg_rule.rule}" => sg_rule
  }
  description              = each.value.new_desc
  security_group_id        = each.value.security_group_id
  type                     = "ingress"
  source_security_group_id = each.value.sg_source
  from_port                = each.value.port
  to_port                  = each.value.port
  protocol                 = each.value.protocol
}
