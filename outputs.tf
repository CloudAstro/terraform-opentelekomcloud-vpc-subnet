output "vpc_subnet" {
  value       = opentelekomcloud_vpc_subnet_v1.vpc_subnet
  description = <<DESCRIPTION
All the argument attributes are also exported as result attributes:
* `id` - Specifies a resource ID in UUID format. Same as OpenStack network ID (`OS_NETWORK_ID`).
* `status` - Specifies the status of the subnet. The value can be `ACTIVE`, `DOWN`, `UNKNOWN`, or `ERROR`.
* `subnet_id` - Specifies the OpenStack subnet ID.
* `network_id` - Specifies the OpenStack network ID.
* `cidr_v6` - Specifies the IPv6 subnet CIDR block. If the subnet is an IPv4 subnet, this parameter is not returned.
* `gateway_ip_v6` - Specifies the IPv6 subnet gateway. If the subnet is an IPv4 subnet, this parameter is not returned.

Example output:
```
output "name" {
  value = module.module_name.vpc_subnet.name
}
```
DESCRIPTION
}
