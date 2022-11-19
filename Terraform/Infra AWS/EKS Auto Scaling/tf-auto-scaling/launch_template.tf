resource "aws_launch_template" "foobar" {
  name_prefix   = "foobar"
  image_id      = var.instance_ami
  instance_type = var.instance_type
}

/*resource "aws_autoscaling_group" "bar" {
  availability_zones = ["us-east-1a"]
  desired_size       = 1
  max_size           = 2
  min_size           = 1

  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }
}*/