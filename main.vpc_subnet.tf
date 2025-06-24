resource "opentelekomcloud_vpc_subnet_v1" "vpc_subnet" {
  name              = var.name
  description       = var.description
  cidr              = var.cidr
  gateway_ip        = var.gateway_ip
  vpc_id            = var.vpc_id
  dhcp_enable       = var.dhcp_enable
  ipv6_enable       = var.ipv6_enable
  primary_dns       = var.primary_dns
  secondary_dns     = var.secondary_dns
  dns_list          = var.dns_list
  availability_zone = var.availability_zone
  ntp_addresses     = var.ntp_addresses
  tags              = var.tags

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
    }
  }
}
