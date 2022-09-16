
resource "aws_instance" "web" {

  ami = var.instance_ami
  instance_type = var.instance_type
  tags = var.instance_tags
  vpc_security_group_ids = [var.security_group]
}