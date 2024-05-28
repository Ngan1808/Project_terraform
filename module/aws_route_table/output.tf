output "rt_id" {
  description = "ID of this route table"
  value = aws_route_table.rt_custom_internet.id
}