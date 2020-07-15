resource "aws_internet_gateway" "hello_gateway" {
  vpc_id = aws_vpc.defaultvpc.id

  tags = {
    Name = local.environment
  }

}

resource "aws_vpc" "defaultvpc" {
  cidr_block         = var.environment.cidr_block
  enable_dns_support = true

  tags = {
    Name = local.environment
  }

}
