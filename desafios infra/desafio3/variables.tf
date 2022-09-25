variable "aws_profile" {
  type        = string
  description = "Meu profile da aws"
}

variable "aws_region" {
  type        = string
  description = "aws services region"
}

variable "instance_type" {
  type        = string
  description = "Tipo da instancia"
  default     = "t3.medium"
}

variable "intance_tags_master" {
  type        = map(string)
  description = "tags da instancia"
  default = {
    Name = "Master - instance"
  }
}

variable "intance_tags_worker" {
  type        = map(string)
  description = "tags da instancia"
  default = {
    Name = "Worker - instance"
  }
}

variable "instance_ami" {
  type        = string
  description = "AMI ubuntu"
  default     = "ami-052efd3df9dad4825"
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