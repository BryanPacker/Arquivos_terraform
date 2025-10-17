resource "aws_s3_bucket" "bucket_bryan_exercicio" {
  bucket = var.bucket_name
  tags = {
    Name        = var.bucket_name
    Environment = var.env
  }
}