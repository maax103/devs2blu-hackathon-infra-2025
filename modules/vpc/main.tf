resource "aws_vpc" "codeops-vpc" {
  cidr_block = "172.112.0.0/16"
}

resource "aws_subnet" "subnet_pub_b" {
    vpc_id = aws_vpc.codeops-vpc.id
    cidr_block = cidrsubnet(aws_vpc.codeops-vpc.cidr_block, 8, 4)
    availability_zone = "${var.project_region}b"
    map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_priv_b" {
  vpc_id = aws_vpc.codeops-vpc.id
  cidr_block = cidrsubnet(aws_vpc.codeops-vpc.cidr_block, 8, 6)
  availability_zone = "${var.project_region}b"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.codeops-vpc.id
}

resource "aws_route_table" "route_public" {
  vpc_id = aws_vpc.codeops-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id    
  }
}

resource "aws_route_table_association" "route_pub_b" {
  subnet_id = aws_subnet.subnet_pub_b.id
  route_table_id = aws_route_table.route_public.id  
}
