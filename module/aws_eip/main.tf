resource "aws_eip" "nat1" {
#   depends_on = [aws_ig.ig_custom]
    depends_on = [var.ig_name]
    tags = {
      "Name" = var.name
    }
}