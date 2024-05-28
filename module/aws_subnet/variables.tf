variable "cidr_block" {
  description = "The IP range of subnet"
  type = string
  default = "10.0.2.0/24"
}

variable "availability_zone" {
  description = "The zone which subnet work on"
  type = string
  default = "us-east-1a"
}

variable "map_public_ip_on_launch" {
  description = "map_public_ip_on_launch"
  type = bool
  default = true
}

variable "vpc_id" {
  description = "The ID of VPC which subnet insite"
  type = string
}

variable "name" {
  description = "Name tag of Subnet"
  type = string
  default = "10.0.2.0 - us-east-1a"
}