resource "aws_db_instance" "rds" {
  allocated_storage    = 10
  db_name              = var.db_name
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = "db.t3.micro"
  username             = var.db_user
  password             = var.db_password

  vpc_security_group_ids = [aws_security_group.rds-sg.id]
  db_subnet_group_name = aws_db_subnet_group.rds-subnet-gp.name

  publicly_accessible = true

  skip_final_snapshot  = true
}