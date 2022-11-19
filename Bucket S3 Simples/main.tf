terraform {
  required_version = "1.2.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.30.0"
    }
  }
}
provider "aws" {
  region  = "us-east-1"
  profile = "gasilva"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "my-tf-test-bucket-gleison-tst"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Owner       = "gasilva"
    UpdateAt    = "2022-09-08"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}   