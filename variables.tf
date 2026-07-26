variable "region" {
    type = string
    default     = "us-east-1"
    description = "The AWS region to deploy resources in"
}

variable "bucket" {
    type = string
    default = "chuka-terraform-day1-577638397757"
    description = "The name of the S3 bucket"
}

variable "name" {
type = string
default = "chuka-terraform-day1"
description = "This is a tag for tracking"
}

variable "environment" {
    type = string
    default = "learning"
    description = "This is a tag for tracking"
}
