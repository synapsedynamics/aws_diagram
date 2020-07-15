# This variable exported by a separate output, sensitive = true
variable "rds_blue_login" {
  type = object({
    username = string
    password = string
  })
  default = {
    username = "cloudChaser"
    password = "LarryEllison5000"
  }
}

variable "rds_blue" {
  type = object({
    name               = string
    maintenance_window = string
    engine             = string
    # If auto_minor_version_upgrade is enabled, you can provide a prefix of the
    # version such as 5.7 (for 5.7.10) and this attribute will ignore differences
    # in the patch version automatically (e.g. 5.7.17)
    # https://www.terraform.io/docs/providers/aws/r/db_instance.html
    allow_major_version_upgrade = bool
    engine_version              = string
    allocated_storage           = number
    max_allocated_storage       = number
    storage_type                = string
    instance_class              = string
  })

  default = {
    name                        = "blue1"
    maintenance_window          = "sun:09:00-sun:11:00"
    allow_major_version_upgrade = true
    allocated_storage           = 8
    max_allocated_storage       = 10
    engine                      = "mariadb"
    engine_version              = "10.4"
    storage_type                = "gp2"
    instance_class              = "db.t2.micro"
  }
}
