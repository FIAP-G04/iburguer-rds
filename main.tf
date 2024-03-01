resource "aws_db_instance" "rds" {
  allocated_storage    = 10
  db_name              = var.db_name
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = "db.t3.micro"
  username             = var.db_user
  password             = var.db_password

  vpc_security_group_ids = [ aws_security_group.sg-rds.id ]
  db_subnet_group_name = aws_db_subnet_group.rds_sg.name

  skip_final_snapshot  = true
}

module "vpc-new" {
  source = "./module/vpc"
  prefix = var.prefix
  vpc_cidr_block = var.vpc_cidr_block
}

data "aws_security_groups" "allowed-sgs" {
  filter {
    name   = "tag:Name"
    values = ["${var.prefix}-sg"]
  }
}

resource "aws_security_group" "sg-rds" {
  vpc_id = module.vpc-new.vpc_id

  # ingress = [ 
  #   {
  #     from_port = 0
  #     to_port = 0
  #     protocol = -1
  #     security_groups = [  
  #         data.aws_security_groups.allowed-sgs[*].id
  #     ]
  #   } ]

  tags = {
    Name = "${var.prefix}-sg-rds"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allowed_subnets" {
  security_group_id = aws_security_group.sg-rds.id
  from_port = 0
  to_port = 0
  ip_protocol = -1
  referenced_security_group_id = data.aws_security_groups.allowed-sgs[*].id
}

resource "aws_db_subnet_group" "rds_sg" {
  name = "${var.prefix}-db-subnet-group"
  subnet_ids = [ module.vpc-new.subnet_ids ]

  tags = {
    Name= "${var.prefix}-db-subnet-group"
  }
}