# Terraform Settings Block
terraform {
  required_version = "~> 1.13"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      
      version = "~> 6.18"      
     }
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "terraform-on-aws-eks"
    key    = "dev/eks-cluster/terraform.tfstate"
    region = "us-east-1" 
 
    # For State Locking
    dynamodb_table = "dev-ekscluster"    
  }  
}

# Terraform Provider Block
provider "aws" {
  region = var.aws_region
}