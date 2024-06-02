variable "cidr_block" {
  
  description = "IP range of VPC"
  type = string
  default = "10.0.0.0/16"
}


variable "instance_tenancy" {
  description = "The instance_tenancy of VPC"
  type = string
  default = "default"
}

variable "name" {
  
  description = "The name tags of VPC"
  type = string
  default = "vpc"
}