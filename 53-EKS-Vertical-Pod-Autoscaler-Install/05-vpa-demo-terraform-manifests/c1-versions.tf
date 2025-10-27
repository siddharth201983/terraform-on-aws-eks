# Terraform Settings Block
terraform {
  required_version = "~> 1.13"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      
      version = "~> 6.18"
     }
    kubernetes = {
      source = "hashicorp/kubernetes"
      
      version = ">= 2.38"
    }      
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }     
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "terraform-on-aws-eks"
    key    = "dev/eks-vpa-demo-app/terraform.tfstate"
    region = "us-east-1" 

    # For State Locking
    dynamodb_table = "dev-vpa-demo-app"    
  }     
}

