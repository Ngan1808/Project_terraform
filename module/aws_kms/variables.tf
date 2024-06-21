variable "description" {
  type        = string
  default     = "Complete key example showing various configurations available"
}

variable "deletion_window_in_days" {
  type        = number
  default     = 7
}

variable "enable_key_rotation" {
  type        = bool
  default     = true
}

variable "is_enabled" {
  type        = bool
  default     = true
}

variable "key_usage" {
  type        = string
  default     = "ENCRYPT_DECRYPT"
}

variable "multi_region" {
  type        = bool
  default     = false
}

variable "key_owners" {
  type        = list(string)
  default     = ["arn:aws:iam::012345678901:role/owner"]
}

variable "key_administrators" {
  type        = list(string)
  default     = ["arn:aws:iam::012345678901:role/admin"]
}

variable "key_users" {
  type        = list(string)
  default     = ["arn:aws:iam::012345678901:role/user"]
}

variable "key_service_users" {
  type        = list(string)
  default     = ["arn:aws:iam::012345678901:role/ec2-role"]
}

variable "aliases" {
  type        = list(string)
  default     = ["one", "foo/bar"]
}

variable "computed_aliases" {
  type        = map(string)
  default     = {
    ex = {
      name = "example"
    }
  }
}

variable "aliases_use_name_prefix" {
  type        = bool
  default     = true
}

variable "grants" {
  type        = map(string)
  default     = {
    lambda = {
      grantee_principal = "arn:aws:iam::012345678901:role/lambda-function"
      operations        = ["Encrypt", "Decrypt", "GenerateDataKey"]
      constraints = {
        encryption_context_equals = {
          Department = "Finance"
        }
      }
    }
  }
}

variable "tags" {
  type        = map(string)
  default     = {
    Terraform   = "true"
    Environment = "dev"
  }
}
