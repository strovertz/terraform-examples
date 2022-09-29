resource "aws_lb" "k8s-server-lb" {
  name               = var.k8s_internal_lb_name
  load_balancer_type = "network"
  internal           = "true"
  subnets            = aws_subnet.prod-subnet-public-1.id

  enable_cross_zone_load_balancing = true

  tags = merge(
    local.tags,
    {
      Name = "lb-namehere"
    }
  )
 /*   depends_on = [
    aws_subnet.prod-subnet-public-1
  ]*/
}

resource "aws_lb_listener" "k8s-server-listener" {
  load_balancer_arn = aws_lb.k8s-server-lb.arn

  protocol = "TCP"
  port     = var.kube_api_port

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.k8s-server-tg.arn
  }

  tags = merge(
    local.tags,
    {
      Name = "lb-listener-gleison"
    }
  )

}

resource "aws_lb_target_group" "k8s-server-tg" {
  port               = var.kube_api_port
  protocol           = var.tcp
  vpc_id             = aws_vpc.k8s-vpc.id
  preserve_client_ip = false

  depends_on = [
    aws_lb.k8s-server-lb
  ]

  health_check {
    protocol = var.tcp
    interval = 15
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_attachment" "target" {

  depends_on = [
    aws_autoscaling_group.k8s_servers_asg,
    aws_lb_target_group.k8s-server-tg
  ]

  autoscaling_group_name = aws_autoscaling_group.k8s_servers_asg.name
  lb_target_group_arn    = aws_lb_target_group.k8s-server-tg.arn
}