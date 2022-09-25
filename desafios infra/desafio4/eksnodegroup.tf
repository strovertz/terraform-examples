resource "aws_eks_node_group" "nginx" {
  cluster_name    = aws_eks_cluster.desafio-4.name
  node_group_name = "Nginx Node Group"
  node_role_arn   = aws_iam_role.node-group-iam.arn
  subnet_ids      = aws_subnet.prod-subnet-public-1.id

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1


  }
    
  instance_types = [var.instance_type]
  
  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.node-group-iam-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.node-group-iam-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.node-group-iam-AmazonEC2ContainerRegistryReadOnly,
  ]
}