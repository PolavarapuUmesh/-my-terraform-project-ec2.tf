#provider_aws
provider "aws"{
  region = "us-east-1"
}

#vpc
resource "aws_vpc" "jenkins_vpc"{
   cidr_block ="10.0.0.0/16"
   instance_tenancy = "default"
   tags={
     Name="jenkins_vpc"
  }
}

# sunets hosts are available
resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.jenkins_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags={
    Name="public_subnet_1"
  }
}
resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.jenkins_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags={
    Name="public_subnet_2"
  }
}
resource "aws_subnet" "public_subenet_3" {
  vpc_id = aws_vpc.jenkins_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1c"
  tags={
    Name="public_subnet_3"
  }
}

#EC2
resource "aws_instance" "dump_instance" {
  ami           = "YOUR_AMI"  
  instance_type = "t2.micro"               

  tags = {
    Name = "my-terraform-instance" 
  }
}

#sg 
resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.jenkins_vpc.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
