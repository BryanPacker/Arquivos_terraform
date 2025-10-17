module "EC2" {
  source = "./Arquivos_terraform/modules/EC2"

  aws_region           = var.aws_region
  instance_type        = var.instance_type
  instance_name        = var.instance_name
  instance_namenpublic = var.instance_namenpublic
}
module "ALB" {
  source = "./Arquivos_terraform/modules/ALB"

  vpc_id       = "vpc-01367bb93348e0739"
  subnet_id    = module.EC2.subnet_id
  instance_ids = module.EC2.instance_ids_BryanNpublic
  aws_region   = var.aws_region
}