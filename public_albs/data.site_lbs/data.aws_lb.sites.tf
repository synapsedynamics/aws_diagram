data "aws_lb" "sites" {
  for_each = local.sites
  name     = each.key
}

locals {
  sitelb_name = [ for value in data.aws_lb.sites: value.name ] 
  sitelb_arn = [ for value in data.aws_lb.sites: value.arn ] 
  lb_arn = zipmap(local.sitelb_name, local.sitelb_arn)
}

output "lb_arn" {
  value = local.lb_arn
}
