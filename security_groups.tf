# Security groups provision very quickly (at the time of this writing) however 
# AWS can take about 40 minutes (or more?) to delete a security group.
# Use  terraform destry -target=  to delete a security group.

# This security_group intentionally a one_off because db_reports has no open
# ports which could potentially result in all ports unintentionally open.
# A conditonal statement may be added to the resource that loops
# through vars.security_groups
resource "aws_security_group" "db_reports" {
  name   = "db_reports"
  vpc_id = aws_vpc.defaultvpc.id

  tags = {
    name = "db_reports"
    managed_by_terraform = "true"
  }
}

resource "aws_security_group" "public_alb" {
  name   = "public_alb"
  vpc_id = aws_vpc.defaultvpc.id

  tags = {
    name = "public_alb"
    managed_by_terraform = "true"
  }
    ingress {
    description = "HTTP/TLS from internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

}

resource "aws_security_group" "security_group" {
  for_each = {
    for security_group in var.security_groups : security_group.name => security_group
  }
  name = each.value.name
  vpc_id = aws_vpc.defaultvpc.id

  tags = {
    name = each.value.name
    managed_by_terraform = "true"
  }

}
