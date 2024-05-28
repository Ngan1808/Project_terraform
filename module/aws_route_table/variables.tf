variable "vpc_id" {
  description = "The ID of VPC which route table apply in"
  type = string
}

variable "gateway_id" {
  description = "The ID of internet gateway which route table apply in"
  type = string
}

variable "cidr_block" {
  description = "IP range of this route table"
  type = string
  default = "0.0.0.0/0"
}

variable "name" {
  description = "Name of this route table"
  type = string
  default = "rt_internet"
}