variable "region" {
    description = "AWS region (normally us-east-1)"
    type        = string
}
variable "profile" {
    description = "AWS profile to use"
    type        = string
}
variable "limit_requests" {
  description = "Number of requests allowed per 5 minutes per IP"
  type        = number
  }