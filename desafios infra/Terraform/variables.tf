variable "aws_region" {

  type = string

  description = "Região Padrão AWS"

  # default = "" // deixando em branco permite que o user preencha "runtime"

}

variable "aws_profile" {

  type = string

  description = "Profile padrão aws"

  #default = "gasilva"

}

variable "aws_secgrp_port" {

  type = number

  description = "Portas to|from"

  default = 80

}

variable "cidr_blocks" {

  type = string

  description = "when cidr_blocks equals '0.0.0.0/0'"

  default = "0.0.0.0/0"
}

variable "cidr_blocks_ssh" {

  type = string

  description = "when cidr_blocks is defined by usr'"

  ##default = "0.0.0.0/0"
}

variable "tcp" {

  type = string

  description = "tcp"

  default = "tcp"

}

variable "instance_ami" {

  type = string

  description = "AMI da instancia"

  default = "ami-05fa00d4c63e32376"
}

variable "instance_type" {

  type = string

  description = "Instance type"

  default = "t2.micro"
}

variable "instance_tags" {

  type = map(string)

  description = "tags"

  default = {

    Name = "Teste-inicial"

    Project = "Terraform testes"

  }
}

variable "PRIVATE_KEY_PATH" {
  default = "aws-key"
}

variable "PUBLIC_KEY_PATH" {
  default = "aws-key.pub"
}

variable "EC2_USER" {
  default = "ubuntu"
}