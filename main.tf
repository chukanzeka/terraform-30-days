terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>5.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "my_terraform_bucket" {
    bucket = "chuka-terraform-day1-577638397757"

    tags = {
        Name = "chuka-terraform-day1"
        Environment = "learning"
    }
}