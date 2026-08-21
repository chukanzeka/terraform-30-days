resource "aws_s3_bucket" "my_terraform_bucket" {
    bucket = "${var.project_name}-app-storage-${var.aws_account_id}"

    tags = {
        Name = "${var.project_name}-s3"
        Environment = var.environment
}
}

resource "aws_s3_bucket_versioning" "my_terraform_bucket_version" {
    bucket = aws_s3_bucket.my_terraform_bucket.id
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "my_terraform_bucket_sse_config" {
    bucket = aws_s3_bucket.my_terraform_bucket.id

    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }  
    }
}

resource "aws_s3_bucket_public_access_block" "my_terraform_bucket_public_access_block" {
    bucket = aws_s3_bucket.my_terraform_bucket.id

    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
}