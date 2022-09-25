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

  default = "0.0.0.0/0"
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

  default = "t3.medium"
}

variable "instance_tags" {

  type = map(string)

  description = "tags"

  default = {

    Name = "Servidor-Nginx"

    Project = "Desafio 2 - Clustar com pod Nginx"

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

variable "create_namespace" {
  type        = bool
  default     = true
  description = "Whether to create Kubernetes namespace with name defined by `namespace`."
}

variable "namespace" {
  type        = string
  default     = "kube-system"
  description = "Kubernetes namespace to deploy Cluster Autoscaler Helm chart."
}

variable "mod_dependency" {
  default     = null
  description = "Dependence variable binds all AWS resources allocated by this module, dependent modules reference this variable."
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Variable indicating whether deployment is enabled."
}

variable "helm_chart_name" {
  type        = string
  default     = "cluster-autoscaler"
  description = "Cluster Autoscaler Helm chart name to be installed"
}

variable "helm_chart_release_name" {
  type        = string
  default     = "cluster-autoscaler"
  description = "Helm release name"
}

variable "fullname_override" {
  type        = string
  default     = "aws-cluster-autoscaler"
  description = "Helm fullnameOverride"
}

variable "helm_chart_version" {
  type        = string
  default     = "9.9.2"
  description = "Cluster Autoscaler Helm chart version."
}

variable "helm_chart_repo" {
  type        = string
  default     = "https://kubernetes.github.io/autoscaler"
  description = "Cluster Autoscaler repository name."
}

variable "cluster_name" {
  type        = string
  description = "The name of the cluster"
}

variable "service_account_name" {
  type        = string
  default     = "cluster-autoscaler"
  description = "Cluster Autoscaler service account name"
}