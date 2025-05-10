output "backend_private_ip" {
  description = "Endereço IP privado da instância Backend EC2"
  value       = aws_instance.backend_ec2_b.private_ip
}
