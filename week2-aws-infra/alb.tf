resource "aws_lb_target_group" "my_target_group" {
    name = "chuka-alb-target-group"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.main.id
    target_type = "instance"

    health_check {
    path = "/"
    healthy_threshold = 2
    }

    tags = {
        Name = "${var.project_name}-chuka-alb-target-group"
        Environment = var.environment
    }
}

resource "aws_lb" "my-application-load-balancer" {
    name = "${var.project_name}-my-alb"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.web_sg.id]
    subnets = [aws_subnet.public_az1.id, aws_subnet.public_az2.id]

    tags = {
        Name = "${var.project_name}-my-application-load-balancer"
        Environment = var.environment
    }
}

resource "aws_lb_listener" "my-alb-listener" {
    load_balancer_arn = aws_lb.my-application-load-balancer.arn
    port = "80"
    protocol = "HTTP"

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.my_target_group.arn
    }
}