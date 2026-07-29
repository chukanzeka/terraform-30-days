terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>5.0"
        }
    }
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
