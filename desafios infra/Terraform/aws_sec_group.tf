resource "aws_security_group" "default" {
  name = "ec2-sec-ports"
  vpc_id = aws_vpc.my_vpc

  # Liberar a porta 80 para acesso livre via Internet
  ingress {
    from_port   = var.aws_secgrp_port
    to_port     = var.aws_secgrp_port
    protocol    = var.tcp
    cidr_blocks = [var.cidr_blocks]
    ipv6_cidr_blocks = [ "::/0" ]
  }

  ingress {

    from_port   = 443
    to_port     = 443
    protocol    = var.tcp
    cidr_blocks = [var.cidr_blocks]
    ipv6_cidr_blocks = [ "::/0" ]

  }
  # Liberar todo o tráfego de saida
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = var.tcp
    cidr_blocks = [var.cidr_blocks]
  }
}

resource "aws_security_group" "ssh_open" {
  # Liberar a porta para acesso restrito via ssh
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = var.tcp
    cidr_blocks = [var.cidr_blocks_ssh]
  }
}