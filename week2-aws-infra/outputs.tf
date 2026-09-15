output "vpc_id" {
    value = aws_vpc.main.id
}

output "public_subnet_az1_id" {
    value = aws_subnet.public_az1.id
}

output "public_subnet_az2_id" {
    value = aws_subnet.public_az2.id
}

output "private_subnet_az1_id" {
    value = aws_subnet.private_az1.id
}

output "private_subnet_az2_id" {
    value = aws_subnet.private_az2.id
}

output "web_sg_id" {
  value = aws_security_group.web_sg.id
}

output "app_sg_id" {
  value = aws_security_group.app_sg.id
}

output "db_sg_id" {
  value = aws_security_group.db_sg.id
}

output "ec2_instance_profile_name" {
  value = aws_iam_instance_profile.ec2_profile.name
}

output "web_server_public_ip" {
  value = aws_instance.web.public_ip
}

output "bucket_arn" {
  value = aws_s3_bucket.my_terraform_bucket.arn
}

output "bucket_name" {
  value = aws_s3_bucket.my_terraform_bucket.id
}

output "rds_endpoint" {
  value = aws_db_instance.my_database_instance.endpoint
}

output "alb_dns_name" {
  value = aws_lb.my-application-load-balancer.dns_name
}