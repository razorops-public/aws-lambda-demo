output "role_arn" {
  description = "IAM role ARN."
  value       = var.create_role ? aws_iam_role.role[0].arn : null
}

output "role_name" {
  description = "IAM role name."
  value       = var.create_role ? aws_iam_role.role[0].name : null
}

output "credentials" {
  description = "IAM user credentials for deployment"
  sensitive   = true
  value       = aws_iam_access_key.creds.encrypted_secret
}
