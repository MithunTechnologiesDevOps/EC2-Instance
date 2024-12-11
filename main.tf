resource "aws_instance" "this" {
  ami = var.ami
  instance_type =  var.instance_type
  key_name = var.keyname
  availability_zone = var.availability_zone 
  subnet_id =  var.subnet_id
  user_data = var.user_data
  tags = merge({"Name": var.ec2_name},var.comman_tags)
  vpc_security_group_ids = [aws_security_group.this.id]

}
resource "aws_security_group" "this" {
    
  name = var.sg_name
  description = var.sg_description
  vpc_id = var.sg_vpc_id

  dynamic "ingress" {

    for_each = var.sg_inbound_rules

    content {
      from_port = ingress.value.from_port
      to_port = ingress.value.to_port
      description = ingress.value.description
      protocol = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }

  }

  egress {
    to_port = 0
    from_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow All Desistionations "
  }

  tags = merge({"Name": var.sg_name},var.comman_tags)

}