variable "name" {
  type        = string
  nullable    = false
  description = <<DESCRIPTION
* `name` - (Required) The subnet name. The value is a string of `1` to `64` characters that can contain letters,
  digits, underscores (`_`), and hyphens (`-`).

Example input:
```
name = "snet-example"
```
DESCRIPTION
}

variable "description" {
  type        = string
  default     = null
  description = <<DESCRIPTION
* `description` - (Optional) A description of the VPC subnet.

Example input:
```
description = "description"
```
DESCRIPTION
}

variable "cidr" {
  type        = string
  nullable    = false
  description = <<DESCRIPTION
* `cidr` - (Required) Specifies the network segment on which the subnet resides. The value must be in CIDR format.
  The value must be within the CIDR block of the VPC. The subnet mask cannot be greater than `28`.
  Changing this creates a new Subnet.

Example input:
```
cidr = "10.0.0.0/28"
```
DESCRIPTION
}

variable "gateway_ip" {
  type        = string
  nullable    = false
  description = <<DESCRIPTION
* `gateway_ip` - (Required) Specifies the gateway of the subnet. The value must be a valid IP address.
  The value must be an IP address in the subnet segment. Changing this creates a new Subnet.

Example input:
```
gateway_ip = "10.0.0.1"
```
DESCRIPTION

}

variable "vpc_id" {
  type        = string
  nullable    = false
  description = <<DESCRIPTION
* `vpc_id` - (Required) Specifies the ID of the VPC to which the subnet belongs. Changing this creates a new Subnet.

Example input:
```
vpc_id = opentelekomcloud_vpc_v1.example.id
```
DESCRIPTION
}

variable "dhcp_enable" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
* `dhcp_enable` - (Optional) Specifies whether the DHCP function is enabled for the subnet. The value can
  be `true` or `false`. If this parameter is left blank, it is set to `true` by default.

Example input:
```
dhcp_enable = false
```
DESCRIPTION
}

variable "ipv6_enable" {
  type        = bool
  default     = false
  description = <<DESCRIPTION
* `ipv6_enable` - (Optional) Specifies whether IPv6 is enabled. If IPv6 is enabled, you can use IPv6 CIDR blocks. The value can
  be `true` or `false`. If this parameter is left blank, it is set to `false` by default.

Example input:
```
ipv6_enable = true
```
DESCRIPTION
}

variable "primary_dns" {
  type        = string
  default     = "100.125.4.25"
  description = <<DESCRIPTION
* `primary_dns` - (Optional) Specifies the IP address of DNS server 1 on the subnet. The value must be a
  valid IP address. Default is `100.125.4.25`, OpenTelekomCloud internal DNS server.

Example input:
```
primary_dns = "100.125.4.25"
```
DESCRIPTION
}

variable "secondary_dns" {
  type        = string
  default     = "100.125.129.199"
  description = <<DESCRIPTION
* `secondary_dns` - (Optional) Specifies the IP address of DNS server 2 on the subnet. The value must be a
  valid IP address. Default is `100.125.129.199`, OpenTelekomCloud secondary internal DNS server.

Example input:
```
secondary_dns = "100.125.129.199"
```
DESCRIPTION
}

variable "dns_list" {
  type        = list(string)
  default     = null
  description = <<DESCRIPTION
* `dns_list` - (Optional) Specifies the DNS server address list of a subnet. This field is required if you
  need to use more than two DNS servers. This parameter value is the superset of both DNS server address
  1 and DNS server address 2.

Example input:
```
dns_list = ["100.125.4.25", "100.125.129.199", "100.125.129.200"]
```
DESCRIPTION
}

variable "availability_zone" {
  type        = string
  default     = null
  description = <<DESCRIPTION
* `availability_zone` - (Optional) Identifies the availability zone (AZ) to which the subnet belongs.
  The value must be an existing AZ in the system. Changing this creates a new Subnet.

Example input:
```
availability_zone = "eu-de-01"
```
DESCRIPTION
}

variable "ntp_addresses" {
  type        = string
  default     = null
  description = <<DESCRIPTION
* `ntp_addresses` - (Optional) Specifies the NTP server address configured for the subnet.

Example input:
```
ntp_addresses = "10.100.0.33,10.100.0.34"
```
DESCRIPTION
}

variable "tags" {
  type        = map(string)
  default     = null
  description = <<DESCRIPTION
* `tags` - (Optional) The key/value pairs to associate with the subnet.

Example input:
```
tags = {
  foo = "bar"
  key = "value"
}
```
DESCRIPTION
}


variable "timeouts" {
  type = object({
    create = optional(string)
    delete = optional(string)
  })
  default     = null
  description = <<DESCRIPTION
* `timeouts` - (Optional) A timeouts block. This allows you to specify timeouts for create and delete operations.
  * `create` - (Optional) The time to wait for the VPC to be created.
  * `delete` - (Optional) The time to wait for the VPC to be deleted.

Example input:
```
timeouts = {
  create = "1m"
  delete = "1m"
}
```
DESCRIPTION
}
