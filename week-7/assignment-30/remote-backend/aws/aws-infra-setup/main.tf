terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# S3 bucket for Terraform state
resource "aws_s3_bucket" "backend" {
  bucket = var.bucket_name

  tags = {
    Name        = "Terraform Remote State Bucket"
    Environment = "Demo"
  }
}

# Enable versioning (recommended for Terraform state)
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.backend.id

  versioning_configuration {
    status = "Enabled"
  }
}

# DynamoDB table for state locking
resource "aws_dynamodb_table" "lock_table" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Terraform Lock Table"
    Environment = "Demo"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.backend.bucket
}

output "dynamodb_table" {
  value = aws_dynamodb_table.lock_table.name
}
