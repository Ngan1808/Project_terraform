variable "ami" {
  description = "Amazon machine image"
  type = string
}

variable "instance_type" {
  description = "Size of VM"
  type = string
}

variable "subnet_id" {
  description = "Subnet ID of which Ec2 in"
  type = string
}

variable "key_name" {
  description = "Key name"
  type = string
}

variable "vpc_security_group_ids" {
  description = "vpc_security_group_ids"
  type = list(string)
}

variable "name" {
  description = "Name of Ec2"
  type = string
  default = "ec2_instance"
}