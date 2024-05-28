resource "aws_vpc" "custom_vpc" {
  cidr_block = var.cidr_block #IP range available inside VPC
  instance_tenancy = var.instance_tenancy

  tags = {
    "Name" = var.name
  }
}