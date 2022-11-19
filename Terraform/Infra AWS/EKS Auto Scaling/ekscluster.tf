resource "aws_eks_cluster" "desafio-4" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks-iam.arn

  vpc_config {
    subnet_ids = [aws_subnet.prod-subnet-public-1.id, aws_subnet.prod-subnet-public-2.id]
  }
}

output "endpoint" {
  value = aws_eks_cluster.desafio-4.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.desafio-4.certificate_authority[0].data
}