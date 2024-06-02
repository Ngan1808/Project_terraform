output "subnet_id" {
  
  value = aws_subnet.public_subnet.id
  description = "ID of subnet"
}