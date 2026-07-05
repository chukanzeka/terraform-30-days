output "bucket_arn" {
    value = aws_s3_bucket.my_terraform_bucket.arn
}

output "region" {
    value = aws_s3_bucket.my_terraform_bucket.region
}

output "bucket_domain_name"{
    value = aws_s3_bucket.my_terraform_bucket.bucket_domain_name
}

output "account_id" {
    value = data.aws_caller_identity.current.account_id
}