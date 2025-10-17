# modules/lambda/main.tf

# IAM Role para a Lambda
resource "aws_iam_role" "lambda_role" {
  name = var.lambda_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# Política básica de execução
resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.lambda_role.name
}

# Política personalizada para S3
resource "aws_iam_role_policy" "lambda_s3_policy" {
  name = "${var.lambda_role_name}_s3_policy"
  role = aws_iam_role.lambda_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:PutObjectAcl",
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::${var.bucket_name}",
          "arn:aws:s3:::${var.bucket_name}/*"
        ]
      }
    ]
  })
}

# Arquivo ZIP com o código da função
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = var.putArchive_file
  output_path = "${var.lambda_name}.zip"
}

# Lambda Function
resource "aws_lambda_function" "lambda_s3_putArchive" {
  filename         = data.archive_file.lambda_zip.output_path
  function_name    = var.lambda_name
  role            = aws_iam_role.lambda_role.arn
  handler         = "${replace(var.putArchive_file, ".py", "")}.lambda_handler"
  runtime         = var.env_lambda_runtime
  timeout          = 30
  memory_size      = 256
  
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  
  environment {
    variables = {
      BUCKET_NAME = var.bucket_name
      ENVIRONMENT = var.env
    }
  }
  depends_on = [
    aws_iam_role_policy.lambda_s3_policy,
    aws_iam_role_policy_attachment.lambda_basic_execution
  ]
}