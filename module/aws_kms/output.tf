# Outputs for AWS KMS Key
output "kms_key_id" {
  description = "The ID of the AWS KMS key"
  value       = aws_kms_key.this[0].key_id
}

output "kms_key_arn" {
  description = "The ARN of the AWS KMS key"
  value       = aws_kms_key.this[0].arn
}

output "kms_key_alias" {
  description = "The alias of the AWS KMS key"
  value       = aws_kms_alias.this[0].id
}

output "kms_key_policy" {
  description = "The policy JSON of the AWS KMS key"
  value       = aws_kms_key.this[0].policy
}

# Outputs for AWS KMS External Key
output "kms_external_key_id" {
  description = "The ID of the AWS KMS external key"
  value       = aws_kms_external_key.this[0].id
}

output "kms_external_key_arn" {
  description = "The ARN of the AWS KMS external key"
  value       = aws_kms_external_key.this[0].arn
}

# Outputs for AWS KMS Replica Key
output "kms_replica_key_id" {
  description = "The ID of the AWS KMS replica key"
  value       = aws_kms_replica_key.this[0].key_id
}

output "kms_replica_key_arn" {
  description = "The ARN of the AWS KMS replica key"
  value       = aws_kms_replica_key.this[0].arn
}

# Outputs for AWS KMS Replica External Key
output "kms_replica_external_key_id" {
  description = "The ID of the AWS KMS replica external key"
  value       = aws_kms_replica_external_key.this[0].id
}

output "kms_replica_external_key_arn" {
  description = "The ARN of the AWS KMS replica external key"
  value       = aws_kms_replica_external_key.this[0].arn
}

# Outputs for AWS KMS Grants
output "kms_grants" {
  description = "Map of AWS KMS grants"
  value       = aws_kms_grant.this
}

# Outputs for AWS KMS Aliases
output "kms_aliases" {
  description = "Map of AWS KMS aliases"
  value       = aws_kms_alias.this
}
