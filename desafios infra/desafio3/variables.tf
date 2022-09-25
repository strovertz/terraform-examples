variable "aws_profile" {
  type = string
  description = "Meu profile da aws"
}

variable "aws_region" {
  type = string
  description = "aws services region"
}

variable "instance_type" {
  type = string
  description = "Tipo da instancia"
  default = "t3.medium"
}

variable "intance_tags_master" {
  type = map(string)
  description = "tags da instancia"
  default = {
    Name = "Master - instance"
  }
}

variable "intance_tags_worker" {
  type = map(string)
  description = "tags da instancia"
  default = {
    Name = "Worker - instance"
  }
}

variable "instance_ami" {
  type = string
  description = "AMI ubuntu"
  default = "ami-052efd3df9dad4825" 
}