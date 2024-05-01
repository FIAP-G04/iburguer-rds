terraform {
  required_version = ">= 0.13.1"
  required_providers {
    aws = ">=5.38.0"
    local = ">=2.4.1"
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
    }
  }
  backend "s3" {
    bucket = "iburguer-bucket-rds"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
    region = "us-east-1"
}

provider "mongodbatlas" {
  public_key = var.mongodbatlas_public_key
  private_key  = var.mongodbatlas_private_key
}