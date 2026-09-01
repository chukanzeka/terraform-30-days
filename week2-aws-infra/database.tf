resource "aws_db_subnet_group" "my_database_subnet" {
    name = "${var.project_name}-database"
    subnet_ids = [aws_subnet.private_az1.id, aws_subnet.private_az2.id]

    tags = {
       Name = "${var.project_name}-rds"
        Environment = var.environment 
    }
}

resource "aws_db_instance" "my_database_instance" {
    identifier = "${var.project_name}-rds-instance"
    engine = "postgres"
    engine_version = "16.3"
    instance_class = "db.t3.micro"
    allocated_storage = 20
    db_name = "chuka_terraform_database"
    username = "dbadmin"
    password = data.aws_secretsmanager_secret_version.db_password.secret_string
    db_subnet_group_name = aws_db_subnet_group.my_database_subnet.name
    vpc_security_group_ids = [aws_security_group.db_sg.id]
    skip_final_snapshot = true
    multi_az = false
    publicly_accessible = false
    tags = {
        Name = "${var.project_name}-rds-instance"
        Environment = var.environment
    }
}

data "aws_secretsmanager_secret" "db_password" {
  name = "chuka-terraform/db-password"
}

data "aws_secretsmanager_secret_version" "db_password" {
  secret_id = data.aws_secretsmanager_secret.db_password.id
}