output "ec2_private_ip_Bryan" {
  value = module.EC2.private_ip_Bryan
}
output "ec2_public_ip_Bryan" {
  value = module.EC2.public_ip_Bryan
}
output "ec2_private_ip_BryanNpublic" {
  value = module.EC2.private_ip_BryanNpublic
}
output "alb_dns" {
  value = module.ALB.alb_dns_name
}
output "alb_arn" {
  value = module.ALB.alb_arn
}
output "instance_ids_BryanNpublic" {
  value = module.EC2.instance_ids_BryanNpublic
}
output "instance_ids_Bryan" {
  value = module.EC2.instance_ids_Bryan
}