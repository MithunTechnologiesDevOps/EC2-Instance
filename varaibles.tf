variable "ami" {
  type = string
  description = "AMI Id to be used for E2"
}

variable "instance_type" {
  type = string
  default = "t2.mirco"
  description = "Type of the ec2 instance to be created"
}

variable "keyname" {
  type = string
  description = "AWS Key Pair Name to be used"
}

variable "availability_zone" {
  type = string
  description = "AWS A.Z in which ec2 to be created"
}

variable "subnet_id" {
  type = string
  default = null 
}

variable "user_data" {
  type = string
  default = null
}

variable "ec2_name" {
  type = string
  description = "Name tag value of ec2"
}

variable "comman_tags" {
  type = map(string)
  default = {}
  description = "Common Tags Map"
}

variable "sg_name" {
  type = string
  description = "Name of the S.G"
}

variable "sg_description" {
  type = string
  description = "Description Of SG"
}
variable "sg_vpc_id" {
  default = null
  type = string
  description = "Under which VPC it should create S.G"
}

variable "sg_inbound_rules" {
  type = list(object({
    from_port = number
    to_port = number
    description = string
    protocol = string
    cidr_blocks = list(string)
  }))
  
  description = "List of Security Group In Bound Rules"

}