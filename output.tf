output "nginx_public_ip" {
  description = "Endereço IP público da instância NGINX EC2"
  value       = module.ec2.nginx_public_ip
}

output "nginx_private_ip" {
  description = "Endereço IP privado da instância NGINX EC2"
  value       = module.ec2.nginx_private_ip
}

output "backend_private_ip" {
  description = "Endereço IP privado da instância Backend EC2"
  value       = module.backend.backend_private_ip
}