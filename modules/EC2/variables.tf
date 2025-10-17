variable "aws_region" {
    type        = string
}
variable "instance_type" {
    type        = string
}
variable "instance_name" {
    type        = list(string)
}
variable "environment" {
    type        = string
}
variable "force_destroy" {
    type        = bool
}
variable "bucket_name" {
    type        = list(string)
}

