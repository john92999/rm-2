terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 3.0"
      }
    }
}
provider "aws" {
 region = "us-west-2"
}

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "main"
    }
}
resource "aws_subnet" "web1" {
    vpc_id = "aws_vpc.main.id"
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-west-2a"
    tags = {
        Name = "web1"
    }
}
resource "aws_subnet" "db1" {
    vpc_id = "aws_vpc.main.id"
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-west-2b"
    tags = {
     Name = "db1"
    }
}