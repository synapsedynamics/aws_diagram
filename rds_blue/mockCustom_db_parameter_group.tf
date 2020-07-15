resource "aws_db_parameter_group" "parameter_group" {
  name = "highly-custom-and-optimized-parameter-group"
  # Hardcoding the line below to prevent blind [mis]use may make sense
  family = "${local.rds.engine}${local.rds.engine_version}"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }
}
