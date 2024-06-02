variable "subnet_id" {
  description = "Subnet ID of subnet which NAT for"
  type = string
}

variable "allocation_id" {
  description = "EIP ID of EIP will be NAT"
  type = string
}

variable "name" {
  description = "Name of NAT gateway"
  type = string
}

variable "ig_name" {
  description = "Internet gateway of VPC"
  type = string
  nullable = true
}