locals {
  tags = {
    "environment" = "dev"
    "provisioner" = "terraform"
    "scope"       = "k8s-cluster"
  }
}