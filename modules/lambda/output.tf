output "lambda_function_arn" {
  value       = aws_lambda_function.lambda_s3_putArchive.arn
}

output "lambda_function_name" {
  value       = aws_lambda_function.lambda_s3_putArchive.function_name
}

output "lambda_id" {
  value       = aws_lambda_function.lambda_s3_putArchive.id
}