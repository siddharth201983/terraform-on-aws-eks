# Terraform Settings Block
terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      
      version = ">= 6.18"
     }
  }
}

# Terraform Provider Block
provider "aws" {
  region = var.aws_region
}