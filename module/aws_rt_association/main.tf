resource "aws_route_table_association" "rt_custom_internet_association" {
  subnet_id = var.subnet_id
  route_table_id = var.route_table_id
}