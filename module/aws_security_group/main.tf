resource "aws_security_group" "sg_custom" {
  vpc_id = var.vpc_id

  egress {
    from_port = var.egress_group_rules.from_port
    to_port = var.egress_group_rules.to_port
    protocol = var.egress_group_rules.protocol
    cidr_blocks = var.egress_group_rules.cidr_blocks
  }


  dynamic "ingress" {
    for_each = var.ingress_group_rules
    content {
      from_port = ingress.value.from_port
      to_port = ingress.value.to_port
      protocol = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  tags = {
    "Name" = var.name
    "Description" = "sg_custom"
  }
}