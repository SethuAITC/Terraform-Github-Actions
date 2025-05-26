provider "aws" {
  region = "us-east-2"
}

resource "aws_security_group" "instance_sg" {
  name        = "instance-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = "vpc-02dd22c6a71b9fbd6"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
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
}

resource "aws_instance" "web" {
  ami                         = "ami-04f167a56786e4b09"  # Ubuntu 22.04 LTS for us-east-2
  instance_type               = "t2.medium"
  subnet_id                   = "subnet-07d27fd7bb3e4126b"
  vpc_security_group_ids      = [aws_security_group.instance_sg.id]
  associate_public_ip_address = true
  key_name                    = "ssh-key"  

  tags = {
    Name = "Terraform-EC2 Latest"
  }
}
