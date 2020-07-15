#output merged_sites {
#  value = local.merged_sites
#}
output sites {
  value = local.sites
}
# output sites_lbs {
#   value = local.sites_lbs
# }

# output "meh" {
#   value = local.sites
# }

# output whatnew {
#   value = local.whatnew
# }
# output lb_arn {
#   value = local.lb_arn
# }

# output "yes" {
#    value = [
#      for index, x in local.sites:
#      merge(x, {(local.sites_lbs[index]) = local.sites[index]})
#  ]
#  }

# output "listeners" {
#   value = aws_lb_listener.site
# }
# 
# output "ec2_ids" {
#   value = local.ec2_instance_ids
# }
