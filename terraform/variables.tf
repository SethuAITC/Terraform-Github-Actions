variable "aws_region" {
  default = "us-east-2"
}

variable "ami_id" {
  default = "ami-04f167a56786e4b09"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "key_name" {
  description = "EC2 SSH key name"
  type        = string
}
