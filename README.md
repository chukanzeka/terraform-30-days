# Terraform 30 Days

A 30-day hands-on Terraform learning project focused on AWS infrastructure.
Built as part of a structured learning plan to go from zero to job-ready with Terraform.

## What This Project Covers

- Week 1: HCL syntax, variables, outputs, state, remote backend
- Week 2: Real AWS infrastructure — VPC, EC2, S3, RDS, ALB
- Week 3: Modules, for_each, workspaces, quality tools
- Week 4: CI/CD pipeline, security, capstone project

## Prerequisites

- AWS account with IAM user configured
- Terraform installed (v1.7.5+)
- AWS CLI configured (`aws configure`)

## Setup

1. Clone the repo
2. Copy `terraform.tfvars.example` to `terraform.tfvars`
3. Fill in your values in `terraform.tfvars`
4. Run `terraform init`
5. Run `terraform plan`
6. Run `terraform apply`

## Remote State

State is stored remotely in S3 with DynamoDB locking.
Create these manually before running `terraform init`:
- S3 bucket for state storage
- DynamoDB table with partition key `LockID`

## Author

Chuka Nzeka — Cloud Automation Engineer Intern, SohamTech UK