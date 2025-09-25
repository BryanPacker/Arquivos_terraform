resource "aws_dynamodb_table" "terraform_state_lock" {
  name         = "${var.dynamodb_table_name}-${var.environment}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Environment = var.environment
    Name        = "${var.dynamodb_table_name}-${var.environment}"
  }
}