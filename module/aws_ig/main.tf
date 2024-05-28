resource "aws_internet_gateway" "ig_custom" {
  vpc_id = var.vpc_id

  tags = {
    "Name" = var.name
  }
}