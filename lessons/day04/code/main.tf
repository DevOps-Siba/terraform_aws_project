
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

terraform {
  backend "s3" {
    bucket       = "terra-state-bucket-26"  #aws s3 mb s3://terra-state-bucket-26 --region ap-south-1  cmd use for create  backend s3 bucket before you mention in youur backend optins.
    key          = "dev/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# AWS Provider
provider "aws" {
  region = var.region
}

variable "region" {
  description = "The AWS region where resources will be created"
  type    = string
  default = "ap-south-1"

}

variable "channel_name" {
  description = "this is for name pupose"
  type = string
  default = "siba-tf-bucket-2026"
}
variable "instance_type" {
  description = "The type of EC2 instance to creaate"
  type  = string
  default = "t2.micro"
}
variable "environment" {
  description = "The environment for which resources are being created"
  type    = string
  default = "dev"

}

locals {
  env = var.environment
  bucket_name = "${var.channel_name}-${var.environment}-${var.region}"
  vpc_name = "${var.environment}-vpc"
  
}

# Create application S3 bucket (NOT backend bucket)
resource "aws_s3_bucket" "my_bucket" {
  bucket = local.bucket_name

  tags = {
    Name        = local.bucket_name
    Environment = var.environment
  }
}


resource "aws_vpc" "example" {
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "${var.environment}-vpc"
    Environment = var.environment
  }
}


resource "aws_instance" "example" {
  instance_type = var.instance_type
  ami      = data.aws_ami.amazon_linux.id
  region = var.region

  tags = {
    Name = "${var.environment}-ec2-instance"
    Environment = var.environment

  }
}


output "vpc_id" {
  description = "The ID of the created vpc"
  value  = aws_vpc.example.id
}


output "ec2_id" {
  description = "the ID of the created EC2 instances"
  value = aws_instance.example.id
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value = aws_instance.example.public_ip
}



