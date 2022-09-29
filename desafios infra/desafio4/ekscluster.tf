resource "aws_eks_cluster" "desafio-4" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks-iam.arn

  vpc_config {
    subnet_ids = [aws_subnet.prod-subnet-public-1.id, aws_subnet.prod-subnet-public-2.id]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  /*depends_on = [
    aws_iam_role_policy_attachment.ekscluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.EKS-AmazonEKSVPCResourceController,
  ]*/
}

output "endpoint" {
  value = aws_eks_cluster.desafio-4.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.desafio-4.certificate_authority[0].data
}