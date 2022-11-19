resource "aws_autoscaling_group_tag" "example" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.nginx.resources : resources.autoscaling_groups]
    ) : asg.name]
  )

  tag {
    key   = "k8s.io/cluster-autoscaler/node-template/label/eks.amazonaws.com/capacityType"
    value = "SPOT"

    propagate_at_launch = false
  }
}