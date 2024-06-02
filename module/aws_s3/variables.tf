variable "bucket" {
  description = "The bucket name"
  type = string
  default = "s3_custom_bucket"
}

variable "name_tag" {
  description = "Name tag of this bucket"
  type = string
}

variable "environment" {
  description = "The environment which private bucket work in"
  type = string
}