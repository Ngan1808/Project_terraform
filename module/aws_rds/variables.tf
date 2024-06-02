variable "allocated_storage" {
  description = "Volumne of DB"
  type = number
  default = 10
}

variable "db_name" {
  description = "Name of database"
  type = string
}

variable "engine" {
  description = "The database engine used"
  type = string
}

variable "engine_version" {
  description = "Version of engine used for databse"
  type = string
}

variable "instance_class" {
  description = "Instance class for this database"
  type = string
}

variable "username" {
  description = "Username to log in to database"
  type = string
}

variable "password" {
  description = "Password to log in to database"
  type = string
}

variable "parameter_group_name" {
  description = "Parameter group name"
  type = string
}

variable "skip_final_snapshot" {
  description = "Would you skip final snapshot"
  type = bool
  default = true
}