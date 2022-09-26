resource "aws_vpc" "k8s-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy = "default"
}

resource "aws_internet_gateway" "prod-igw" {
  vpc_id = aws_vpc.k8s-vpc.id
}