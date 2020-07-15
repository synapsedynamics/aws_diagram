data "aws_security_groups" "by_name" {
  for_each = toset(data.terraform_remote_state.base.outputs.security_group_names)

  tags = {
    name = each.value
    managed_by_terraform = "true"
  }
}

locals {
  sg_keys = [ for key in keys(data.aws_security_groups.by_name): key ]
  sg_ids = [ for value in data.aws_security_groups.by_name: element(value.ids, 1) ]
  sg_zipmap = zipmap(local.sg_keys, local.sg_ids)
}

output sg_ids {
  value =  local.sg_zipmap
}
