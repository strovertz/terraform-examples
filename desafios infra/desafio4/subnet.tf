resource "aws_subnet" "prod-subnet-public-1" {
  vpc_id                  = aws_vpc.nginx-vpc.id // Referencing the id of the VPC from abouve code block
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true" // Makes this a public subnet
  availability_zone       = "us-east-1a"
  tags = {
    Name = "Nginx-Prod1-Subnet"
  }
}

resource "aws_subnet" "prod-subnet-public-2" {
  vpc_id                  = aws_vpc.nginx-vpc.id // Referencing the id of the VPC from abouve code block
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = "true" // Makes this a public subnet
  availability_zone       = "us-east-1b"
    tags = {
    Name = "Prod2-Subnet"
  }
}