variable "aws_region" {
      type        = string
}
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