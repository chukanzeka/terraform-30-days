resource "aws_instance" "web" {
  ami                    = "ami-0db1c5c6dc64eb019"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_az1.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = "chuka-terraform-key"
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y nginx
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name        = "${var.project_name}-web-server"
    Environment = var.environment
  }
}