# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "~> 6.4" # Optional but recommended in production
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
  region  = "us-east-1"
}

# Resource Block
resource "aws_instance" "ec2demo" {
  ami           = "ami-07860a2d7eb515d9a" # Amazon Linux in us-east-1, update as per your region
  instance_type = "t3.micro"
  key_name      = "default-aws-kp"

  tags = {
    Name = "Terraform-EC2-Demo"
  }
}