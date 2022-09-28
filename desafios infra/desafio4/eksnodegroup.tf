resource "aws_eks_node_group" "nginx" {
  cluster_name    = aws_eks_cluster.desafio-4.name
  node_group_name = "nginx"
  node_role_arn   = aws_iam_role.node-group-iam.arn
  subnet_ids      = [aws_subnet.prod-subnet-public-1.id, aws_subnet.prod-subnet-public-2.id]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1


  }

  instance_types = [var.instance_type]

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.node-group-iam-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.node-group-iam-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.node-group-iam-AmazonEC2ContainerRegistryReadOnly,
  ]
}

resource "aws_autoscaling_group_tag" "example" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.nginx.resources : resources.autoscaling_groups]
    ) : asg.name]
  )

  autoscaling_group_name = aws_autoscaling_group.bar.name

  tag {
    key   = "k8s.io/cluster-autoscaler/node-template/label/eks.amazonaws.com/capacityType"
    value = "SPOT"

    propagate_at_launch = false
  }
}