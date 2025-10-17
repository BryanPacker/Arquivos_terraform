# Remote State S3 Backend Creation
module "DynamoDB" {
  source = "./Arquivos_terraform/modules/DynamoDB"
  aws_region = var.aws_region
  dynamodb_table_name = var.dynamodb_table_name
  environment = var.environment
  depends_on = [module.S3]
}
module "S3" {
  source = "./Arquivos_terraform/modules/S3"
  aws_region = var.aws_region
  s3_bucket_name = var.s3_bucket_name
  environment = var.environment
  force_destroy = var.force_destroy
}
# Creation of EC2 Instance with all atributes
module "EC2_2909" {
  source = "./Arquivos_terraform/modules/EC2_2909"
  aws_region = var.aws_region
  vpc_id = var.vpc_id
  subnet_cidr = var.subnet_cidr
  availability_zone = var.availability_zone
  instances = var.instances
  depends_on = [module.S3, module.DynamoDB]
  }
data "aws_ec2_instance_type" "performance_info" {
  for_each = var.instances
  instance_type = each.value.instance_type
}