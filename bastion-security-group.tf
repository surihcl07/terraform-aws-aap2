resource "aws_security_group" "bastion_sg" {
    name = "bastion_sg"
    description = "Allow income connection"
    vpc_id = module.vpc.vpc_id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
        description = "Allow incoming SSH"
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
    tags = {
      "Name" = "bastion-sg"
    }
}