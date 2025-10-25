# Terraform Settings Block
terraform {
  required_version = ">= 1.13.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      
      version = ">= 6.18"
     }
    helm = {
      source = "hashicorp/helm"
      
      
      version = "~> 3.0"
    }
    http = {
      source = "hashicorp/http"
      
      
      version = "~> 3.5"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.20"
    }      
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "terraform-on-aws-eks"
    key    = "dev/aws-lbc/terraform.tfstate"
    region = "us-east-1" 

    # For State Locking
    dynamodb_table = "dev-aws-lbc"    
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