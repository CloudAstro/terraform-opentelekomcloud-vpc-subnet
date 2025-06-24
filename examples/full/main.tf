module "vpc" {
  source         = "CloudAstro/vpc/opentelekomcloud"
  name           = "vpc-example"
  description    = "description"
  cidr           = "10.10.0.0/24"
  secondary_cidr = "172.16.0.0/24"
  region         = "eu-de"

  tags = {
    foo = "bar"
    key = "value"
  }
}

module "subnet" {
  source            = "../.."
  name              = "snet-example"
  description       = "description"
  cidr              = "10.10.0.0/26"
  gateway_ip        = "10.10.0.1"
  vpc_id            = module.vpc.vpc_v1.id
  dhcp_enable       = true
  ipv6_enable       = true
  primary_dns       = "100.125.4.25"
  secondary_dns     = "100.125.129.199"
  availability_zone = "eu-de-01"
  ntp_addresses     = "10.100.0.33,10.100.0.34"
  tags = {
    foo = "bar"
    key = "value"
  }
}
