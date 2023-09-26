variable "vpc_cidr_block" {}
variable "private_subnet_cidr_blocks" {}
variable "public_subnet_cidr_blocks" {}

variable "aws_region" {
  default = "us-west-2"
}

variable "cluster_name" {
  default = "terraform-eks-demo"
  type    = string
}
