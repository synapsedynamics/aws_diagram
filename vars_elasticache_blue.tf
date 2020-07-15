variable "elasticache_blue" {
  type = object({
    cluster_id         = string
    maintenance_window = string
    engine             = string
    engine_version     = string
    node_type          = string
    num_cache_nodes    = number
    port               = number
  })

  default = {
    cluster_id         = "blue"
    maintenance_window = "sun:11:00-sun:13:00"
    engine             = "redis"
    engine_version     = "5.0.5"
    node_type          = "cache.t2.micro"
    num_cache_nodes    = 1
    port               = 6379
  }
}
