variable "aws_profile" {
  type        = string
  description = "Meu profile da aws"
  default = "gasilva"
}

variable "aws_region" {
  type        = string
  description = "aws services region"
  default = "us-east-1"
}

variable "instance_type" {
  type        = string
  description = "Tipo da instancia"
  default     = "t2.small"
}

variable "instance_tags_master" {
  type        = map(string)
  description = "tags da instancia"
  default = {
    Name = "Master - instance"
  }
}

variable "instance_tags_worker" {
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

  default = "0.0.0.0/0"
}

variable "kube_api_port" {
  type        = number
  default     = 6443
  description = "Kubeapi Port"
}

variable "tcp" {

  type = string

  description = "tcp"

  default = "tcp"

}


variable "k8s_master_template_prefix" {
  type    = string
  default = "k8s_master_tpl"
}

variable "k8s_worker_template_prefix" {
  type    = string
  default = "k8s_worker_tpl"
}

variable "k8s_version" {
  type    = string
  default = "1.23.5"
}

variable "k8s_pod_subnet" {
  type    = string
  default = "10.244.0.0/16"
}

variable "k8s_service_subnet" {
  type    = string
  default = "10.96.0.0/12"
}

variable "k8s_dns_domain" {
  type    = string
  default = "cluster.local"
}

variable "k8s_internal_lb_name" {
  type    = string
  default = "k8s-server-tcp-lb"
}

variable "k8s_server_desired_capacity" {
  type        = number
  default     = 3
  description = "k8s server ASG desired capacity"
}

variable "k8s_server_min_capacity" {
  type        = number
  default     = 3
  description = "k8s server ASG min capacity"
}

variable "k8s_server_max_capacity" {
  type        = number
  default     = 4
  description = "k8s server ASG max capacity"
}

variable "k8s_worker_desired_capacity" {
  type        = number
  default     = 3
  description = "k8s server ASG desired capacity"
}

variable "k8s_worker_min_capacity" {
  type        = number
  default     = 3
  description = "k8s server ASG min capacity"
}

variable "k8s_worker_max_capacity" {
  type        = number
  default     = 4
  description = "k8s server ASG max capacity"
}

variable "cluster_name" {
  type        = string
  default     = "k8s-cluster"
  description = "Cluster name"
}


variable "PATH_TO_PUBLIC_LB_CERT" {
  type        = string
  description = "Path to the public LB https certificate"
  default = "privatekey.pem"
}

variable "PATH_TO_PUBLIC_LB_KEY" {
  type        = string
  description = "Path to the public LB key"
  default = "public.crt"
}

variable "install_longhorn" {
  type    = bool
  default = false
}

variable "longhorn_release" {
  type    = string
  default = "v1.2.3"
}

variable "install_nginx_ingress" {
  type        = bool
  default     = false
  description = "Create external LB true/false"
}

variable "k8s_ext_lb_name" {
  type    = string
  default = "k8s-ext-lb"
}

variable "extlb_listener_http_port" {
  type    = number
  default = 30080
}

variable "extlb_listener_https_port" {
  type    = number
  default = 30443
}

variable "extlb_http_port" {
  type    = number
  default = 80
}

variable "extlb_https_port" {
  type    = number
  default = 443
}

variable "s3_bucket_name" {
  type    = string
  default = "my-bucket-k8s"
}

/*variable "vpc_public_subnets" {
  type        = string
  description = "The public vpc subnets ids"
  default = "prod-subnet-public-1"
}*/