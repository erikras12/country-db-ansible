terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}



resource "aws_instance" "http_server" {
  ami = "ami-03a725ae7d906005d"
  key_name = "default-ec2"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.http_server_sg.id]
  subnet_id = "subnet-05e6d4c6413f10b56"
}