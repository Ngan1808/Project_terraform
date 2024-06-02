variable "vpc_id" {
  description = "The ID of VPC which security grouped for"
  type = string
}

variable "ingress_group_rules" {
  description = "Ingress group rules for security group"
  type = list(object({
    from_port = number
    to_port = number
    protocol = string
    cidr_blocks = list(string)
  }))
  default = [
  {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  },

  {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },

  {
    from_port = 6443
    to_port = 6443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  
  {
    from_port = 2379
    to_port = 2379
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }]
}

variable "egress_group_rules" {
  description = "Egress group rules for security group"
  type = object({
    from_port = number
    to_port = number
    protocol = string
    cidr_blocks = list(string)
  })
  default = {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "name" {
  description = "Name of secutiry group"
  type = string
}
