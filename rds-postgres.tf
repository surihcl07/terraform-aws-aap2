resource "aws_db_subnet_group" "aap2-subnet" {
  name       = "aap2-subnet"
  subnet_ids = module.vpc.private_subnets

  tags = {
    Name = "AAP2"
  }
}

resource "aws_security_group" "rds" {
  name   = "aap2_rds"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "aap2_rds"
  }
}

resource "aws_db_parameter_group" "aap2-para-grp" {
  name   = "aap2"
  family = "postgres13"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

resource "aws_db_instance" "aap2" {
  identifier             = "aap2"
  instance_class         = "db.t3.micro"
  allocated_storage      = 10
  engine                 = "postgres"
  engine_version         = "13.7"
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.aap2-subnet.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  parameter_group_name   = aws_db_parameter_group.aap2-para-grp.name
  publicly_accessible    = false
  skip_final_snapshot    = true
}