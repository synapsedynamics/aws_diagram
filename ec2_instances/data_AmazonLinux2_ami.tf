data "aws_ami" "AmazonLinux2" {
  owners      = ["137112412989"]
  most_recent = "true"
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

