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

output "rds_db_user" {
  value = module.rds.rds_db_user
}

output "rds_db_name" {
  value = module.rds.rds_db_name
}

output "rds_db_host" {
  value = module.rds.rds_db_host
}