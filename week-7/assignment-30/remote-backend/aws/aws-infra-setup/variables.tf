variable "bucket_name" {
  description = "Unique S3 bucket name for storing remote Terraform state"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Name of DynamoDB table for Terraform state locking"
  type        = string
}

variable "region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}
