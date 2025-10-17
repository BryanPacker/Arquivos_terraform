data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}  
resource "aws_subnet" "bryan_subnet" {
  vpc_id            = "vpc-01367bb93348e0739"
  cidr_block        = "192.168.31.0/24"
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = true  # Para instâncias receberem IP público
  tags = {
    Name = "Bryan-Subnet"
  }
}
resource "aws_security_group" "bryan_sg" {
  name_prefix = "bryan-sg-"
  vpc_id      = "vpc-01367bb93348e0739"
  # Regra de entrada - HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Regra de entrada - HTTPS
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Regra de saída - Permite tudo
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Bryan-SG"
  }
}
resource "aws_instance" "instance_Bryan" {
  for_each = toset(var.instance_name)
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  security_groups = [ aws_security_group.bryan_sg.id ]
  subnet_id = aws_subnet.bryan_subnet.id
  tags = {
    Name = each.value
  }
}
resource "aws_s3_bucket" "aws_s3_bucket" {
  for_each = toset(var.bucket_name)
  force_destroy = var.force_destroy
  tags = {
    Name        = each.value
    Environment = var.environment
  }
}
