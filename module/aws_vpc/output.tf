output "vpc_id" {
  description = "The ID of VPC"
  value = aws_vpc.custom_vpc.id
}