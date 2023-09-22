terraform {
  backend "s3" {
    bucket = "nginx-app"
    region = "us-east-1"
    key = "jenkins-server/terraform.tfstate"
  }
}
