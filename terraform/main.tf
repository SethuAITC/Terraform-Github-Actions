provider "aws" {
  region = "us-east-2"
}
resource "aws_instance" "web" {
  ami                         = "ami-04f167a56786e4b09"  # Ubuntu 22.04 LTS for us-east-2
  instance_type               = "t2.medium"
  subnet_id                   = "subnet-07d27fd7bb3e4126b"
  vpc_security_group_ids      = [aws_security_group.instance_sg.id]
  associate_public_ip_address = true
  key_name                    = "ssh-key"  

  tags = {
    Name = "Terraform-EC2"
  }
}
