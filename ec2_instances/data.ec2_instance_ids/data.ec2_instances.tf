# These data blocks separate from  ../  because  terraform -detailed-exitcode
# returns non-zero exit status on data queries such as these.

# If zero instances are found when one of the keys are queried
# each query will fail.
data "aws_instances" "sites" {
  for_each = {
    for site in local.sites : site.name => site
  }
  instance_tags = {
    role = each.key
  }
}

# An alternative to the data block above.
#   data "aws_instances" "content-manager" {
#     instance_tags = {
#       role = "content-manager"
#     }
#   }
#   
#   data "aws_instances" "website" {
#     instance_tags = {
#       role = "website"
#     }
#   }
