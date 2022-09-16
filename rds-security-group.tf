resource "aws_security_group" "rds" {
  name   = "aap2_rds"
  vpc_id = module.vpc.vpc_id
  depends_on = [
    aws_security_group.bastion_sg, aws_security_group.controller_sg

  ]

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [ aws_security_group.bastion_sg.id, aws_security_group.controller_sg.id ]
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [ aws_security_group.bastion_sg.id, aws_security_group.controller_sg.id ]
  }

  tags = {
    Name = "aap2_rds"
  }
}