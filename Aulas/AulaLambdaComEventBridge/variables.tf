variable "region" {
  type = string
}
variable "rule_name" {
  type        = string
}
variable "rule_description" {
  type        = string
}
variable "schedule_expression" {
  type        = string
}
variable "permission_statement_id" {
  type        = string
}
variable "lambda_role_name" {
  type = string
}
variable "lambda_name" {
  type = string
}
variable "putArchive_file" {
  type = string
}
variable "env_lambda_runtime" {
  type    = string
}
variable "bucket_name" {
  type = string
}
variable "env" {
  type = string
} 