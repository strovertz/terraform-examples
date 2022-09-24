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

  description = "AMI do ubuntu"

  default = "ami-052efd3df9dad4825"
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

    Name = "Servidor-Nginx"

    Project = "Desafio 1 - Instancia com Nginx"

  }
}

variable "PRIVATE_KEY_PATH" {
  default = "aws-key"
}

variable "PUBLIC_KEY_PATH" {
  default = "id_rsa.pub"
}

variable "EC2_USER" {
  default = "ubuntu"
}