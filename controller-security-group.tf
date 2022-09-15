resource "aws_security_group" "controller_sg" {
    name = "controller_sg"
    description = "Allow income connection"
    vpc_id = module.vpc.vpc_id
    depends_on = [
      aws_security_group.bastion_sg
    ]

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
        description = "Allow HTTP traffic"
    }
    ingress {
        from_port = 27199
        to_port = 27199
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
        description = "Allow SSH from bastion"
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
        description = "Allow HTTPS traffic"
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        security_groups = [ aws_security_group.bastion_sg.id ]
        description = "Allow incoming SSH"
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
    tags = {
      "Name" = "controller_sg"
    }
}