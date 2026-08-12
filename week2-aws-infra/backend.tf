terraform {
    backend "s3" {
        bucket = "chuka-terraform-state-577638397757"
        key = "week2/terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "chuka-terraform-state-lock"
        encrypt = true
    }
}