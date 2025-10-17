# Global
variable "aws_region" {
      type        = string
}
variable "environment" {
    type        = string
}

#DynamoDB Table Name
variable "dynamodb_table_name" {
    type        = string
}

# S3 Bucket
variable "s3_bucket_name" {
    type        = string
}
variable "force_destroy" {
    type        = bool
}

# EC2 Instance
variable "vpc_id" {
      type        = string
}
variable "subnet_cidr" {
      type        = string
}
variable "availability_zone" {
      type        = string
}
variable "instances" {
      type        = map(object({
        instance_type = string
        instance_name = string
      }))
}
