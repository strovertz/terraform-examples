# Policy
resource "aws_iam_policy" "kubernetes_cluster_autoscaler"{
  name        = "kubernetes_cluster_autoscaler"
  path        = "/"
  description = "kubernetes_cluster_autoscaler"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "autoscaling:DescribeAutoScalingGroups",
          "autoscaling:DescribeAutoScalingInstances",
          "autoscaling:DescribeLaunchConfigurations",
          "autoscaling:DescribeTags",
          "autoscaling:SetDesiredCapacity",
          "autoscaling:TerminateInstanceInAutoScalingGroup",
          "ec2:DescribeLaunchTemplateVersions"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

# Role
data "aws_iam_policy_document" "kubernetes_cluster_autoscaler_assume" {

  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [var.cluster_identity_oidc_issuer_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(var.cluster_identity_oidc_issuer, "https://", "")}:sub"

      values = [
        "system:serviceaccount:${var.namespace}:${var.service_account_name}",
      ]
    }

    effect = "Allow"
  }
}

resource "aws_iam_role" "kubernetes_cluster_autoscaler" {
  name               = "${var.cluster_name}-cluster-autoscaler"
  assume_role_policy = data.aws_iam_policy_document.kubernetes_cluster_autoscaler_assume.json
}

resource "aws_iam_role_policy_attachment" "kubernetes_cluster_autoscaler" {
  role       = aws_iam_role.kubernetes_cluster_autoscaler.name
  policy_arn = aws_iam_policy.kubernetes_cluster_autoscaler.arn
}