resource "aws_subnet" "subnets" {
  for_each = {
    for subnet in var.subnets : subnet.cidr => subnet
  }
  vpc_id                  = aws_vpc.defaultvpc.id
  map_public_ip_on_launch = var.public_subnets__map_public_ip_on_launch
  availability_zone       = "${var.environment.region}${each.value.az}"
  cidr_block              = each.value.cidr
  tags = {
    name         = "prod-${each.value.tier}-1${each.value.az}"
    use          = each.value.use
    network_tier = each.value.tier
    environment  = local.environment
  }
}
