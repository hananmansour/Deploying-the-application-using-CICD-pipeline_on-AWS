terraform {
  backend "s3" {
    bucket = "nginx-app-2"
    region = "us-east-1"
    key = "eks/terraform.tfstate"
  }
}
