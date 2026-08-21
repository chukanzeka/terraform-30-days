variable "region" {
    type = string
    default = "us-east-1"
    description = "The AWS region to deploy resources into"
}

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
    description = "The VPC cidr block"
}

variable "project_name" {
    type = string
    default = "chuka-terraform"
    description = "Name of the project"
}

variable "environment" {
    type = string
    default = "dev"
    description = "The environment where resources will be deployed"
}

variable "aws_account_id" {
  type        = string
  default     = "577638397757"
  description = "AWS account ID for unique bucket naming"
}