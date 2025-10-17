resource "aws_s3_bucket" "aws_s3_bucket" {
  bucket = var.s3_bucket_name
  force_destroy = var.force_destroy
    tags = {
        Name        = var.s3_bucket_name
        Environment = var.environment
    }
}