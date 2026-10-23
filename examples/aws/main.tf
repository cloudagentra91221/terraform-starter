# Example AWS Terraform configuration
# Cloud Agentra AI - Starter template

terraform {
  required_version = ">= 1.5"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "ap-south-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

resource "aws_s3_bucket" "example" {
  bucket = "cloud-agentra-example-${var.environment}"
  
  tags = {
    Environment = var.environment
    ManagedBy   = "cloud-agentra-ai"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.example.bucket
}
