resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"
  tags = {
    Name = "vpc-to-ports443-80"
  }
}