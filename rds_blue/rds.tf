resource "aws_db_instance" "rds_a" {
  name                   = "${local.rds.name}b"
  multi_az               = true
  vpc_security_group_ids = [ local.rds_security_group_ids ]
  #  storage_encrypted           = true
  db_subnet_group_name        = aws_db_subnet_group.subnet_group.name
  parameter_group_name        = aws_db_parameter_group.parameter_group.name
  maintenance_window          = local.rds.maintenance_window
  allow_major_version_upgrade = local.rds.allow_major_version_upgrade
  allocated_storage           = local.rds.allocated_storage
  storage_type                = local.rds.storage_type
  engine                      = local.rds.engine
  engine_version              = local.rds.engine_version
  instance_class              = local.rds.instance_class
  # login
  username = local.rds_login.username
  password = local.rds_login.password
}

resource "aws_db_subnet_group" "subnet_group" {
  name       = local.rds.name
  subnet_ids = local.subnet_ids.private
}
