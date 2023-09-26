terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
  }
}

provider "aws" {
  access_key = "AKIAV7ZGHJVSA4SHUH6N"
  secret_key = "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"
  region = "us-east-2"
}