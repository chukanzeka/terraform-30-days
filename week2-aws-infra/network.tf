resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr

    tags = {
       Name = "${var.project_name}-vpc"
       Environment = var.environment
    }
}

resource "aws_subnet" "public_az1" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true

    tags = {
        Name = "${var.project_name}-public-subnet-az1"
        Environment = var.environment
    }
}

resource "aws_subnet" "public_az2" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = true

    tags = {
        Name = "${var.project_name}-public-subnet-az2"
        Environment = var.environment
    }
}

resource "aws_subnet" "private_az1" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.11.0/24"
    availability_zone = "us-east-1a"

    tags = {
        Name = "${var.project_name}-private-subnet-az1"
        Environment = var.environment
    }
}

 resource "aws_subnet" "private_az2" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.12.0/24"
    availability_zone = "us-east-1b"

    tags = {
        Name = "${var.project_name}-private-subnet-az2"
        Environment = var.environment
    }
}

resource "aws_internet_gateway" "main" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "${var.project_name}-igw"
        Environment = var.environment
    }
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main.id
    }

    tags = {
        Name = "${var.project_name}-public-rt"
        Environment = var.environment
    }
}

resource "aws_route_table" "private" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "${var.project_name}-private-rt"
        Environment = var.environment
    }
}

# Public subnet associations
resource "aws_route_table_association" "public_az1" {
  subnet_id      = aws_subnet.public_az1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_az2" {
  subnet_id      = aws_subnet.public_az2.id
  route_table_id = aws_route_table.public.id
}

# Private subnet associations
resource "aws_route_table_association" "private_az1" {
  subnet_id      = aws_subnet.private_az1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_az2" {
  subnet_id      = aws_subnet.private_az2.id
  route_table_id = aws_route_table.private.id
}