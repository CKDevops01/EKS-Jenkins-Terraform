terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.45.0"
    }
  }

  backend "s3" {
    bucket = "ckterraformbackend"
    key    = "jenkins/terraform.tfstate"
    region = "ap-south-1"
  }
}


provider "aws" {
  region = var.region
}