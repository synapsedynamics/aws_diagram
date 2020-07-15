resource "aws_elasticache_cluster" "elasticache" {
  cluster_id        = local.ec.name
  subnet_group_name = aws_elasticache_subnet_group.subnet_group.name
  security_group_ids = local.security_group_ids
  #__fix__ replication_group_id = local..base.blue-instance
  maintenance_window = local.ec.vars.maintenance_window
  engine             = local.ec.vars.engine
  engine_version     = local.ec.vars.engine_version
  node_type          = local.ec.vars.node_type
  num_cache_nodes    = local.ec.vars.num_cache_nodes
  port               = local.ec.vars.port
  tags = {
    service_redis = local.ec.name
  }
}

resource "aws_elasticache_subnet_group" "subnet_group" {
  name       = local.ec.name
  subnet_ids = local.subnet_ids.subnets_private_ids
}
