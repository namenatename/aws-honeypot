resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name   = "main"
    }
}

resource "aws_subnet" "public" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = "10.0.1.0/24"
    map_public_ip_on_launch = true
    tags = {
        Name                = "public"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id   = aws_vpc.main.id
    tags = {
        Name = "igw"
    }
}

resource "aws_route_table" "public" {
    vpc_id         = aws_vpc.main.id
    route {
        cidr_block = var.cidr_open
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name       = "public"
    }
}

resource "aws_route_table_association" "public" {
    subnet_id      = aws_subnet.public.id
    route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "honeypot" {
    name        = "honeypot"
    description = "Security group for honeypot configuration"
    vpc_id      = aws_vpc.main.id

    tags = {
        Name    = "honeypot"
    }
}

resource "aws_vpc_security_group_ingress_rule" "honeypot_ingress" {
    security_group_id = aws_security_group.honeypot.id
    cidr_ipv4         = var.cidr_open
    ip_protocol       = "tcp"
    from_port         = 22
    to_port           = 22
}

