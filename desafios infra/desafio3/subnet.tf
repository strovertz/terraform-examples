resource "aws_subnet" "prod-subnet-public-1" {
  vpc_id                  = aws_vpc.k8s-vpc.id // Referencing the id of the VPC from abouve code block
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true" // Makes this a public subnet
  availability_zone       = "us-east-1a"
}

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.k8s-vpc.id
  cidr_block              = var.cidr_blocks
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name        = "dev-us-east-1a-private-subnet"
    Environment = "Dev"
  }
}
resource "aws_internet_gateway" "ig" {
  vpc_id = "${aws_vpc.k8s-vpc.id}"
  tags = {
    Name        = "dev-igw"
    Environment = "dev"
  }
}
/* Elastic IP for NAT */
resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.ig]
}
/* NAT */
resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.nat_eip.id}"
  subnet_id     = aws_subnet.prod-subnet-public-1.id
  depends_on    = [aws_internet_gateway.ig]
  tags = {
    Name        = "nat"
    Environment = "dev"
  }
}
resource "aws_route" "private_nat_gateway" {
  route_table_id         = "${aws_route_table.private.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.nat.id}"
}