output "instance_public_ip" {
  description = "IP publico da instancia"
  value       = aws_instance.web.public_ip
}