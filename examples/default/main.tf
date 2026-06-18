module "vpc" {
  source  = "CloudAstro/vpc/opentelekomcloud"
  version = "1.1.1"
  name    = "vpc-example"
  cidr    = "10.10.0.0/24"
}

module "subnet" {
  source     = "../.."
  name       = "snet-example"
  cidr       = "10.10.0.0/26"
  gateway_ip = "10.10.0.1"
  vpc_id     = module.vpc.vpc_v1.id
}
