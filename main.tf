provider "aws" {
  access_key = var.aws_credentials.access_key
  secret_key = var.aws_credentials.secret_key
  region     = var.aws_credentials.region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.50.0"
    }
  }
  required_version = "1.5.3"
}
