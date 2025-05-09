output "pub_subnet_b_id" {
  value = aws_subnet.subnet_pub_b.id
}

output "priv_subnet_b_id" {
  value = aws_subnet.subnet_priv_b.id
}

output "vpc_id" {
  value = aws_vpc.codeops-vpc.id
}
