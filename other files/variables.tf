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