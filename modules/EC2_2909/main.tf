data "aws_ami" "Aws_linux_2" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["137112412989"] # Amazon
}
resource "aws_security_group" "bryan_sg" {
  name        = "bryanSLegalG"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
}
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
}
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "bryan_sglegal_aulafinalterraform"
    }
}
resource "aws_subnet" "bryan_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "bryan_subnet_aulafinalterraform"
  }
}
resource "tls_private_key" "keypair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "generated" {
  key_name   = "bryan_keypair"
  public_key = tls_private_key.keypair.public_key_openssh
}
resource "local_file" "private_key" {
  content         = tls_private_key.keypair.private_key_pem
  filename        = "${path.module}/bryan_keypair.pem"
  file_permission = "0400"
}
resource "aws_instance" "EC2_2909" {
  for_each = var.instances
  ami                         = data.aws_ami.Aws_linux_2.id
  instance_type               = each.value.instance_type
  key_name                    = aws_key_pair.generated.key_name
  vpc_security_group_ids      = [aws_security_group.bryan_sg.id]
  subnet_id                   = aws_subnet.bryan_subnet.id
  associate_public_ip_address = true
  
  ebs_block_device {
    device_name           = "/dev/sdf"
    volume_size           = 20  # GB
    volume_type           = "gp3"
    delete_on_termination = true
    encrypted             = true
    tags = {
      Name = "${each.value.instance_name}-data"
    }
  }

  tags = {
    Name = each.value.instance_name
  }
}