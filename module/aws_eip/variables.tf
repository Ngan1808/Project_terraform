variable "ig_name" {
  description = "Name of the internet gateway which need eip"
  type = string
}

variable "name" {
  description = "Name of EIP"
  type = string
  default = "EIPs"
}