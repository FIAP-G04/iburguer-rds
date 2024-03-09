data "aws_security_group" "eks-sg" {
  filter {
    name = "tag:Name"
    values = [ "${var.prefix}-sg" ]
  }
}

resource "aws_db_subnet_group" "rds-subnet-gp" {
  name = "rds_subnets"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.prefix}-rds-subnet-group"
  }
}

resource "aws_security_group" "rds-sg" {
  vpc_id = var.vpc_id
  name = "${var.prefix}-rds-sg"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "rds-sg-rule" {
  type = "ingress"
  from_port = 5432
  to_port = 5432
  protocol = "tcp"
  security_group_id = aws_security_group.rds-sg.id
  cidr_blocks = [ "0.0.0.0/0" ]
}