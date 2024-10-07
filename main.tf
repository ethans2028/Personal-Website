terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

provider "aws" {
  region = var.region
}

provider "aws" {
    alias = "cert_region"
    region = var.cert_region
}