terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>5.0"
        }
    }
backend "s3" {
    bucket = "chuka-terraform-state-577638397757"
    key            = "day5/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "chuka-terraform-state-lock"
    encrypt        = true
}
}  

provider "aws" {
    region = var.region
}

resource "aws_s3_bucket" "my_terraform_bucket" {
    bucket = var.bucket

    tags = {
        name = var.name
        environment = var.environment
    }
}

data "aws_caller_identity" "current" {
}
