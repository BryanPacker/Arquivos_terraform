variable "aws_region" {
    type        = string
}
variable "bucket_name" {
    type        = list(string)
}
variable "s3_bucket_name" {
    type        = string
}
variable "environment" {
    type        = string
}
variable "dynamodb_table_name" {
    type        = string
}
variable "force_destroy" {
    type        = bool
}
variable "instance_type" {
    type        = string
}
variable "instance_name" {
    type        = list(string)
}
