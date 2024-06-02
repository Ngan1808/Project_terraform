resource "aws_nat_gateway" "custom_nat_gateway" {
    allocation_id = var.allocation_id
    subnet_id = var.subnet_id

    tags = {
        "Name" = var.name
    }
    depends_on = [var.ig_name]
}