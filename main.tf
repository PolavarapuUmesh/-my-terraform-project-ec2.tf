provider "aws"{
  region  = "us-east-1"
}

#vpc
resource "aws_vpc" "vedantu_network"{
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  tags={
    Name="prod_vpc"
  }
}

#subnets 
resource "aws_subnet" "public_subnet_1" {
  vpc_id = aws_vpc.vedantu_network.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags={
    Name="subnet_1"
  }
}
resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.vedantu_network.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags={
    Name="subnet_2"
  }
}
resource "aws_subnet" "public_subnet_3" {
  vpc_id     = aws_vpc.vedantu_network.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1c"
  tags={
    Name="subnet_3"
  }
}


