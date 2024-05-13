module "vpc" {
  source = "./module/vpc"
  prefix = var.prefix
  vpc_cidr_block = var.vpc_cidr_block
}

module "rds" {
  source = "./module/rds"
  db_engine = var.db_engine
  db_name = var.db_name
  db_engine_version = var.db_engine_version
  db_user = var.db_user
  db_password = var.db_password
  prefix = var.prefix
  subnet_ids = module.vpc.subnet_ids
  vpc_id = module.vpc.vpc_id
}

module "atlas-mongodb" {
  source = "./module/atlas"
  atlas_org_id = "661daa658c7c1d51e316da2a"
  atlas_project_name = "iburguer"
  environment = "dev"
  cluster_instance_size_name = "M0"
  cloud_provider = "AWS"
  atlas_region = "US_WEST_2"
  mongodb_version = "6.0"
  cidr_block = "0.0.0.0/0"
  db_password = var.db_password
}

module "redis" {
  source = "./module/redis"
  prefix = var.prefix
  db_password = var.db_password
  db_user = var.db_user
  db_user_id = var.db_user
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.subnet_ids
}

output "rds_db_user" {
  value = module.rds.rds_db_user
}

output "rds_db_name" {
  value = module.rds.rds_db_name
}

output "rds_db_host" {
  value = module.rds.rds_db_host
}

output "atlas_cluster_connection_string" { value = module.atlas-mongodb.atlas_cluster_connection_string }
output "project_name"      { value = module.atlas-mongodb.project_name }
output "username"          { value = module.atlas-mongodb.username } 
output "redis_host" {
  value = module.redis.db_host
}