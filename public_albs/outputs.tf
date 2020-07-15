# output "public_albs" {
#   value = aws_lb.public_albs
# }

output "sites" {
  #  value = local.sites
  # Merge local.sites and data.aws_lb.sites together
  value = local.sites
}

# output "sites_lb_arns" {
#   value = data.aws_lb.sites
# }
