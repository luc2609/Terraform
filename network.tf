module "network" {
  source = "./modules/network"
  name   = local.name
  env    = local.env

  region   = data.aws_region.current.name
  vpc_cidr = local.cidr["vpc"]
  azs      = local.azs
}