data "aws_ami" "imagem_ec2" {
    most_recent = true
    owners = ["amazon"]
    filter {
        name = "name"
        values = ["al2023-ami-2023.*-x86_64"]
    }
}

resource "aws_security_group" "sg_pub" {
  vpc_id = "${var.vpc_id}"
}

resource "aws_security_group_rule" "egress_sg_pub_rule" {
  type = "egress"
  protocol = "tcp"
  security_group_id = aws_security_group.sg_pub.id
  cidr_blocks = ["0.0.0.0/0"]
  to_port = 65535
  from_port = 0
}

resource "aws_security_group_rule" "ingress_22_sg_pub_rule" {
  type = "ingress"
  protocol = "tcp"
  security_group_id = aws_security_group.sg_pub.id
  cidr_blocks = ["0.0.0.0/0"]
  from_port = 22
  to_port = 22
}

resource "aws_security_group_rule" "ingress_80_sg_pub_rule" {
  type = "ingress"
  protocol = "tcp"
  security_group_id = aws_security_group.sg_pub.id
  cidr_blocks = ["0.0.0.0/0"]
  from_port = 80
  to_port = 80
}

resource "aws_network_interface" "net_interface_pub_b" {
  subnet_id = "${var.nginx_pub_subnet_id_b}"
}

resource "aws_instance" "nginx_ec2_b" {
  instance_type = "t2.micro"
  ami = data.aws_ami.imagem_ec2.id
  vpc_security_group_ids = [aws_security_group.sg_pub.id]
  subnet_id = "${var.nginx_pub_subnet_id_b}"
  associate_public_ip_address = true
  key_name = "codeops-key"
}
