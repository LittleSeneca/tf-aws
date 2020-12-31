terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 2.70"
        }
    }
}

provider "aws" {
    profile = "default"
    region  = "us-east-1"
}

resource "aws_instance" "guacamole" {
    ami = "ami-0be2609ba883822ec"
    instance_type = "t2.micro"
    key_name = "Virginia"
    security_groups = [ "Wordpress" ]
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.guacamole.id
  allocation_id = aws_eip.guacamole.id
}

resource "aws_eip" "guacamole" {
  vpc = true
}