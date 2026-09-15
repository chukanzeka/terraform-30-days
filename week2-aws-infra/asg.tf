resource "aws_launch_template" "chuka_launch_template" {
    name_prefix = "${var.project_name}-"
    image_id = "ami-0db1c5c6dc64eb019"
    instance_type = "t3.micro"
    key_name = "chuka-terraform-key"
    vpc_security_group_ids = [aws_security_group.app_sg.id]

    iam_instance_profile {
        name = aws_iam_instance_profile.ec2_profile.name
    }
    user_data = base64encode(<<-EOF
        #!/bin/bash
        dnf update -y
        dnf install -y nginx
        systemctl start nginx
        systemctl enable nginx
        EOF
)
tags = {
    Name = "${var.project_name}-chuka-launch-template"
    Environment = var.environment
    }
}

resource "aws_autoscaling_group" "chuka_autoscaling_group" {
    name = "${var.project_name}-chuka-autoscaling-group"
    min_size = 1
    max_size = 3
    desired_capacity = 1
    vpc_zone_identifier = [aws_subnet.public_az1.id, aws_subnet.public_az2.id]
    target_group_arns = [aws_lb_target_group.my_target_group.arn]

    launch_template {
        id = aws_launch_template.chuka_launch_template.id
        version = "$Latest"
    }
}
