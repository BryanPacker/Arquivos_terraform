aws_region = "us-east-2"
#s3
s3_bucket_name = "bucket-bryan-2909"
environment = "dev"
force_destroy = true
#dynamo
dynamodb_table_name = "TabelaDynamoDB"
#ec2
vpc_id = "vpc-01367bb93348e0739"
subnet_cidr = "192.168.56.0/24"
availability_zone = "us-east-2a"
instances = {
 "inst1" = {
    instance_type = "t3.micro"
    instance_name = "inst1-bryan"
 }
 "inst2" = {
    instance_type = "t3.nano"
    instance_name = "inst2-bryan"
 }
} 

