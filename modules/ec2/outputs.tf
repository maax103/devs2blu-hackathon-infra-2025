# IP público da instância NGINX
output "nginx_public_ip" {
  description = "Endereço IP público da instância NGINX EC2"
  value       = aws_instance.nginx_ec2_b.public_ip
}

# IP privado da instância NGINX
output "nginx_private_ip" {
  description = "Endereço IP privado da instância NGINX EC2"
  value       = aws_instance.nginx_ec2_b.private_ip
}
