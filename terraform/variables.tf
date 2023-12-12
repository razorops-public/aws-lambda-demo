variable "name_prefix" {
  description = "Name prefix for AWS resources"
  default     = "demo"
}

variable "aws_region" {
  description = "AWS Region in which lambda function runs"
  default     = "ap-southeast-1"
}

variable "lambdas" {
  description = "list of lambda functions for IAM identity policy"
  default     = []
  type        = list(any)
}

variable "create_role" {
  description = "create lambda execution IAM role"
  default     = false
  type        = bool
}
