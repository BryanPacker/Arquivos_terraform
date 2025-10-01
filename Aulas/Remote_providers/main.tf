module "dynamodb" {
  source              = "./modules/DynamoDB"
  aws_region         = var.aws_region
  dynamodb_table_name = var.dynamodb_table_name
  environment        = var.environment
}
module "s3" {
  source          = "./modules/S3"
  aws_region      = var.aws_region
  s3_bucket_name  = var.s3_bucket_name
  environment    = var.environment
  force_destroy  = var.force_destroy
}
module "ec2" {
  source          = "./modules/EC2"
  aws_region      = var.aws_region
  instance_type   = var.instance_type
  instance_name   = var.instance_name
  environment    = var.environment
  force_destroy  = var.force_destroy
  bucket_name  = var.bucket_name
}
resource "aws_s3_bucket" "bucket_importado" {
 bucket = "giocifer-dev2-bucket"  
}