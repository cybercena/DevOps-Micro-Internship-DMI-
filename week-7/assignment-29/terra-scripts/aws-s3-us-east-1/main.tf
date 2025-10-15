#if you want to use specific version , you can define:
# -----------------------------------
# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 6.0"
#     }
#   }
# }
# ----------------------------------

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

#configure the resource
resource "aws_s3_bucket" "s3-us-east-1" {
  bucket = "sonam-tamang-s3-us-east-1"

  tags = {
    project= "multicloud-foundation"
    Name  = "My bucket"
    Owner = "Sonam Tamang"
    Environment = "dev"
  }
}