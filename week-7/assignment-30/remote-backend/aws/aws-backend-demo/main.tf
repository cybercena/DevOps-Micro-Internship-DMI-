terraform {
  backend "s3" {
    bucket         = "tfstate-backend-demo-2025"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "demo" {
  bucket = "tf-demo-resource-bucket-2025"
  tags = {
    Name        = "Demo S3 Bucket"
    Environment = "Demo"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.demo.bucket
}
