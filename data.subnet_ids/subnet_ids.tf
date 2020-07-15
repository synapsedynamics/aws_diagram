data "aws_subnet_ids" "public" {
  vpc_id = local.base.vpc.id

  tags = {
    network_tier = "public"
  }
}

data "aws_subnet_ids" "private" {
  vpc_id = local.base.vpc.id

  tags = {
    network_tier = "private"
  }
}
