terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.0"
    }
  }
  backend "s3" {
    bucket         = "bucket-bryan-2909"
    key            = "dev/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "TabelaDynamoDB-dev"
    encrypt        = true
  }
}
provider "aws" {
  region = var.aws_region
}
