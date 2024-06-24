provider "aws" {
  region  = "us-east-1"
}

resource "aws_vpc" "vedantu_network"{
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
}
# 120 sunet hosts are available
resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.vedantu_network.id
  cidr_block = "10.0.0.0/25"
}
resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.vedantu_network.id
  cidr_block = "10.0.0.128/25"
}

#this is ec2 ami
resource "aws_instance" "jenkins_server" {
  ami           = "ami-082283201b8a5468d"
  instance_type = "t2.micro"
  key_name="vpc.pem"
  tags = {
    Name = "jenkins-server"
  }
}
  
