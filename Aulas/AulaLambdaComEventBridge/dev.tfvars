# Default all modules
region = "us-east-2"
# S3 variables
bucket_name = "proway-s3-putarchive-bryan-2209"
env = "dev"
# Lambda variables
lambda_name = "lambda_s3_putArchive_function_Bryan"
lambda_role_name = "lambda_execution_role"
putArchive_file = "lambda_function.py"
env_lambda_runtime = "python3.9"
# EventBridge variables
rule_name = "lambda-schedule-2min"
rule_description = "Dispara a cada 2 minutos"
schedule_expression = "rate(2 minutes)"
permission_statement_id = "AllowExecutionFromEventBridge"
