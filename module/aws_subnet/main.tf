resource "aws_subnet" "public_subnet" {
  vpc_id = var.vpc_id
  cidr_block = var.cidr_block
  availability_zone = var.availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    "Name" = "10.0.2.0 - us-east-1a"
  }
}