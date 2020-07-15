resource "aws_instance" "website" {
  count                   = 6
  subnet_id               = element(tolist(local.subnet_ids.private), count.index)
  disable_api_termination = false
  ami                     = data.aws_ami.AmazonLinux2.image_id
  instance_type           = "t2.micro"
  monitoring = true
  security_groups =     [ local.sg_ids.website ]

  tags = {
    role = "website"
  }
}


resource "aws_instance" "content-manager" {
  count                   = 6
  subnet_id               = element(tolist(local.subnet_ids.private), count.index)
  disable_api_termination = false
  ami                     = data.aws_ami.AmazonLinux2.image_id
  instance_type           = "t2.micro"
  monitoring = true
  security_groups =       [ local.sg_ids.content-manager ]

  tags = {
    name = "single_cm_instance"
  }
}

# db_report is an instance that does not accept connections from anything else
# and makes connections only to the RDS instance
resource "aws_instance" "db_reports" {
  count                   = 6
  subnet_id               = element(tolist(local.subnet_ids.private), count.index)
  disable_api_termination = false
  ami                     = data.aws_ami.AmazonLinux2.image_id
  instance_type           = "t2.micro"
  monitoring = true
  security_groups = [ local.sg_ids.db_reports ]

  tags = {
    name = "single_cm_instance"
  }
}

# morty is a backend service that accepts connections from an internal load
# balancer and makes connections to RDS
resource "aws_instance" "morty" {
  count                   = 6
  subnet_id               = element(tolist(local.subnet_ids.private), count.index)
  disable_api_termination = false
  ami                     = data.aws_ami.AmazonLinux2.image_id
  instance_type           = "t2.micro"
  monitoring = true
  security_groups = [ local.sg_ids.morty ]

  tags = {
    name = "single_cm_instance"
  }
}
