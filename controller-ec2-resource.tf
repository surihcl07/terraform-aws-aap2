
data "aws_subnet_ids" "public" {
    vpc_id = module.vpc.vpc_id
    filter {
        name = "tag:Name"
        values = [ "*public*" ]

    }
    depends_on = [
      module.vpc
    ]
      
}
resource "aws_instance" "aap2" {
    count = var.aap2_instace_count
    ami = var.ami
    instance_type = var.instance_type
    key_name = aws_key_pair.key_pair.key_name
    associate_public_ip_address = true
    source_dest_check = false    
    subnet_id = flatten(data.aws_subnet_ids.public.ids)[0]    
    vpc_security_group_ids = [ aws_security_group.controller_sg.id ]
   # user_data = file("aws-user-data.sh")


  # root disk
  root_block_device {
    volume_size           = var.vm_root_volume_size
    volume_type           = var.vm_root_volume_type
    delete_on_termination = true
    encrypted             = true
  }  # extra disk
  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = var.vm_data_volume_size
    volume_type           = var.vm_data_volume_type
    encrypted             = true
    delete_on_termination = true
  }
  
  tags = {
    Name = "aap2-C${count.index}"
  }

  depends_on = [
    module.vpc
  ]
 
}