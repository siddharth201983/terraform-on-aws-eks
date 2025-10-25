# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "~> 3.70"
      version = ">= 4.65"
     }
    helm = {
      source = "hashicorp/helm"
      #version = "2.4.1"
      #version = "~> 2.4"
      version = "~> 3.0"
    }
    http = {
      source = "hashicorp/http"
      
      
      version = "~> 3.5"
    }
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "terraform-on-aws-eks"
    key    = "dev/ebs-storage/terraform.tfstate"
    region = "us-east-1" 

    # For State Locking
    dynamodb_table = "dev-ebs-storage"    
  }     
}

# Terraform AWS Provider Block
provider "aws" {
  region = var.aws_region
}

# Terraform HTTP Provider Block
provider "http" {
  # Configuration options
}