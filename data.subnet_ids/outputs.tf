output "public" {
  value = data.aws_subnet_ids.public.ids
}
output "private" {
  value = data.aws_subnet_ids.private.ids
}
