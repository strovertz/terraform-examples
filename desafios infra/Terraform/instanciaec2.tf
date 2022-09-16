resource "aws_instance" "web" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  tags                   = var.instance_tags
  vpc_security_group_ids = [aws_security_group.mysecgroup.id]
  subnet_id = aws_subnet.prod-subnet-public-1.id
  key_name = aws_key_pair.aws-key.id

  #Jogar o script pra instancia
    provisioner "file" {
    source      = "nginx.sh"
    destination = "/tmp/nginx.sh"
  }
  #Rodar o  script
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/nginx.sh",
      "sudo /tmp/nginx.sh"
    ]
  }
  #key ssh
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("${var.PRIVATE_KEY_PATH}")
  }

}