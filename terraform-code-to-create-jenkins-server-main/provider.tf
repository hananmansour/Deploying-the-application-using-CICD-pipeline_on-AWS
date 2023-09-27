terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
  }
}

provider "aws" {
  access_key = ""
  secret_key = ""
  region = "us-east-2"
}
