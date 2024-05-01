resource "aws_elasticache_subnet_group" "redis-subnet-group" {
  name       = "${var.prefix}-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_elasticache_cluster" "redis-cluster" {
  cluster_id           = "${var.prefix}-cache-cluster"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"
  engine_version       = "6.2"
  port                 = 6379
  subnet_group_name = aws_elasticache_subnet_group.redis-subnet-group.name
}

resource "aws_elasticache_user" "redis-user" {
  user_id       = var.db_user_id
  user_name     = var.db_user
  access_string = "on ~* +@all"
  engine        = "REDIS"

  authentication_mode {
    type      = "password"
    passwords = [var.db_password]
  }
}