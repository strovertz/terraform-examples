resource "aws_route_table" "prod-public-crt" {
  vpc_id = aws_vpc.k8s-vpc.id
  route {
    cidr_block = "0.0.0.0/0"                      // A subnet associada pode alcançar qq um
    gateway_id = aws_internet_gateway.prod-igw.id //CTR utiliza esse ift para alcançar a interner
  }
  tags = {
    Name = "prod-public-crt"
  }
}
/* Routing table for private subnet */
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.k8s-vpc.id
  tags = {
    Name        = "dev-private-route-table"
    Environment = "dev"
  }
}

#cria uma conexão entre a subnet e a route table
resource "aws_route_table_association" "prod-crta-public-subnet-1" {
  subnet_id      = aws_subnet.prod-subnet-public-1.id
  route_table_id = aws_route_table.prod-public-crt.id
} 

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private.id
}