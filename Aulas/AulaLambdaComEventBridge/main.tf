module "s3" {
  source = "./modules/s3"
  region     = var.region
  bucket_name = var.bucket_name
  env = var.env
}
module "lambda" {
  source = "./modules/lambda"
  region     = var.region
  lambda_name = var.lambda_name
  lambda_role_name = var.lambda_role_name
  putArchive_file = var.putArchive_file
  env_lambda_runtime = var.env_lambda_runtime
  bucket_name = var.bucket_name
  env = var.env
}
module "eventBridge" {
  source = "./modules/eventBridge"
  region     = var.region
  rule_name             = var.rule_name
  rule_description      = var.rule_description
  schedule_expression   = var.schedule_expression
  lambda_function_arn   = module.lambda.lambda_function_arn
  lambda_function_name  = module.lambda.lambda_function_name
  permission_statement_id = var.permission_statement_id
  lambda_id = module.lambda.lambda_id
}