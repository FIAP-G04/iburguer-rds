resource "mongodbatlas_project" "atlas-project" {
  org_id = var.atlas_org_id
  name = var.atlas_project_name
}

resource "mongodbatlas_database_user" "db-user" {
  username = "fiap-iburguer"
  password = var.db_password
  project_id = mongodbatlas_project.atlas-project.id
  auth_database_name = "admin"
  roles {
    role_name     = "readWrite"
    database_name = "${var.atlas_project_name}-menu"
  }

  roles {
    role_name     = "readWrite"
    database_name = "${var.atlas_project_name}-payments"
  }
}

resource "mongodbatlas_project_ip_access_list" "ip" {
  project_id = mongodbatlas_project.atlas-project.id
  cidr_block = var.cidr_block
}


resource "mongodbatlas_advanced_cluster" "atlas-cluster" {
  project_id = mongodbatlas_project.atlas-project.id
  name = "${var.atlas_project_name}-${var.environment}-cluster"
  cluster_type = "REPLICASET"
  //backup_enabled = true
  replication_specs {
    region_configs {
      electable_specs {
        instance_size = var.cluster_instance_size_name
      }
      priority      = 7
      provider_name = "TENANT"
      backing_provider_name = var.cloud_provider
      region_name   = var.atlas_region
    }
  }
}