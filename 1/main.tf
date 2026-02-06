resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = "main"
    }
}
resource "aws_subnet" "main_web" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.subnet_cidr[0]
    availability_zone = "us-west-2a"
    tags = {
        Name = "main_web"
    }
}
resource "aws_subnet" "main_db" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.subnet_cidr[1]
    availability_zone = "us-west-2b"
    tags = {
     Name = "main_db"
    }
}

resource "aws_security_group" "main_sgw" {
    vpc_id = aws_vpc.main.id
    count = length(var.ports)
    ingress {
        from_port = var.ports[count.index]
        to_port = var.ports[count.index]
        protocol = "tcp"
        cidr_blocks = [local.anywhere]
    }
    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [local.anywhere]
        ipv6_cidr_blocks = ["::/0"]
    }
    tags = {
        Name = "main_sgw"
    }
}