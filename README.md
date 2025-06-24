<!-- BEGINNING OF PRE-COMMIT-OPENTOFU DOCS HOOK -->
# OpenTelekomCloud Subnet Terraform Module

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-blue.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![OpenTofu Registry](https://img.shields.io/badge/opentofu-registry-yellow.svg)](https://search.opentofu.org/module/CloudAstro/subnet/opentelekomcloud/)

This module is designed to manage Subnets within OpenTelekomCloud (OTC). It enables flexible configuration options for subnet creation, including CIDR block assignments, availability zone selection, and customizable timeouts for create and delete operations.

# Features

- **Subnet Management**: Automates the creation and management of subnets within OpenTelekomCloud.
- **Multiple Availability Zones**: Supports subnet creation across multiple availability zones for improved fault tolerance and availability.
- **CIDR Block Configuration**: Allows for the definition of primary and secondary CIDR blocks for subnet segmentation.
- **Tagging Support**: Includes functionality to add metadata tags for better resource organization.

# Setup Requirements

To successfully apply the module, make sure to source the required variables either through the `.envrc` file or use `direnv` to automatically load environment variables for configuration. This step is crucial for proper execution of the module.

You can also use AK/SK authentication (`OS_ACCESS_KEY` and `OS_SECRET_KEY`) as an alternative to `OS_PASSWORD` and `OS_USERNAME` for accessing OpenTelekomCloud.

Ensure the following variables are set up correctly in your `.envrc` file for authentication:

```shell
export OS_USERNAME="USERNAME"
export OS_PASSWORD="PASSWORD"
export OS_DOMAIN_NAME="OTC000xxxx"
export OS_PROJECT_NAME="eu-de_project-name"
export OS_REGION="eu-de"
```

Once the .envrc file is set up, you can source it in your shell by running the following command:

```shell
source .envrc
```

# Example Usage

This example demonstrates how to provision a subnet across multiple availability zones with CIDR block configurations and custom timeouts:

```hcl
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
```
<!-- markdownlint-disable MD033 -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9.0 |
| <a name="requirement_opentelekomcloud"></a> [opentelekomcloud](#requirement\_opentelekomcloud) | >= 1.36.35 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_opentelekomcloud"></a> [opentelekomcloud](#provider\_opentelekomcloud) | >= 1.36.35 |

## Resources

| Name | Type |
|------|------|
| [opentelekomcloud_vpc_subnet_v1.vpc_subnet](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/vpc_subnet_v1) | resource |

<!-- markdownlint-disable MD013 -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr"></a> [cidr](#input\_cidr) | * `cidr` - (Required) Specifies the network segment on which the subnet resides. The value must be in CIDR format.<br/>  The value must be within the CIDR block of the VPC. The subnet mask cannot be greater than `28`.<br/>  Changing this creates a new Subnet.<br/><br/>Example input:<pre>cidr = "10.0.0.0/28"</pre> | `string` | n/a | yes |
| <a name="input_gateway_ip"></a> [gateway\_ip](#input\_gateway\_ip) | * `gateway_ip` - (Required) Specifies the gateway of the subnet. The value must be a valid IP address.<br/>  The value must be an IP address in the subnet segment. Changing this creates a new Subnet.<br/><br/>Example input:<pre>gateway_ip = "10.0.0.1"</pre> | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | * `name` - (Required) The subnet name. The value is a string of `1` to `64` characters that can contain letters,<br/>  digits, underscores (`_`), and hyphens (`-`).<br/><br/>Example input:<pre>name = "snet-example"</pre> | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | * `vpc_id` - (Required) Specifies the ID of the VPC to which the subnet belongs. Changing this creates a new Subnet.<br/><br/>Example input:<pre>vpc_id = opentelekomcloud_vpc_v1.example.id</pre> | `string` | n/a | yes |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | * `availability_zone` - (Optional) Identifies the availability zone (AZ) to which the subnet belongs.<br/>  The value must be an existing AZ in the system. Changing this creates a new Subnet.<br/><br/>Example input:<pre>availability_zone = "eu-de-01"</pre> | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | * `description` - (Optional) A description of the VPC subnet.<br/><br/>Example input:<pre>description = "description"</pre> | `string` | `null` | no |
| <a name="input_dhcp_enable"></a> [dhcp\_enable](#input\_dhcp\_enable) | * `dhcp_enable` - (Optional) Specifies whether the DHCP function is enabled for the subnet. The value can<br/>  be `true` or `false`. If this parameter is left blank, it is set to `true` by default.<br/><br/>Example input:<pre>dhcp_enable = false</pre> | `bool` | `true` | no |
| <a name="input_dns_list"></a> [dns\_list](#input\_dns\_list) | * `dns_list` - (Optional) Specifies the DNS server address list of a subnet. This field is required if you<br/>  need to use more than two DNS servers. This parameter value is the superset of both DNS server address<br/>  1 and DNS server address 2.<br/><br/>Example input:<pre>dns_list = ["100.125.4.25", "100.125.129.199", "100.125.129.200"]</pre> | `list(string)` | `null` | no |
| <a name="input_ipv6_enable"></a> [ipv6\_enable](#input\_ipv6\_enable) | * `ipv6_enable` - (Optional) Specifies whether IPv6 is enabled. If IPv6 is enabled, you can use IPv6 CIDR blocks. The value can<br/>  be `true` or `false`. If this parameter is left blank, it is set to `false` by default.<br/><br/>Example input:<pre>ipv6_enable = true</pre> | `bool` | `false` | no |
| <a name="input_ntp_addresses"></a> [ntp\_addresses](#input\_ntp\_addresses) | * `ntp_addresses` - (Optional) Specifies the NTP server address configured for the subnet.<br/><br/>Example input:<pre>ntp_addresses = "10.100.0.33,10.100.0.34"</pre> | `string` | `null` | no |
| <a name="input_primary_dns"></a> [primary\_dns](#input\_primary\_dns) | * `primary_dns` - (Optional) Specifies the IP address of DNS server 1 on the subnet. The value must be a<br/>  valid IP address. Default is `100.125.4.25`, OpenTelekomCloud internal DNS server.<br/><br/>Example input:<pre>primary_dns = "100.125.4.25"</pre> | `string` | `"100.125.4.25"` | no |
| <a name="input_secondary_dns"></a> [secondary\_dns](#input\_secondary\_dns) | * `secondary_dns` - (Optional) Specifies the IP address of DNS server 2 on the subnet. The value must be a<br/>  valid IP address. Default is `100.125.129.199`, OpenTelekomCloud secondary internal DNS server.<br/><br/>Example input:<pre>secondary_dns = "100.125.129.199"</pre> | `string` | `"100.125.129.199"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | * `tags` - (Optional) The key/value pairs to associate with the subnet.<br/><br/>Example input:<pre>tags = {<br/>  foo = "bar"<br/>  key = "value"<br/>}</pre> | `map(string)` | `null` | no |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | * `timeouts` - (Optional) A timeouts block. This allows you to specify timeouts for create and delete operations.<br/>  * `create` - (Optional) The time to wait for the VPC to be created.<br/>  * `delete` - (Optional) The time to wait for the VPC to be deleted.<br/><br/>Example input:<pre>timeouts = {<br/>  create = "1m"<br/>  delete = "1m"<br/>}</pre> | <pre>object({<br/>    create = optional(string)<br/>    delete = optional(string)<br/>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_subnet"></a> [vpc\_subnet](#output\_vpc\_subnet) | All the argument attributes are also exported as result attributes:<br/>* `id` - Specifies a resource ID in UUID format. Same as OpenStack network ID (`OS_NETWORK_ID`).<br/>* `status` - Specifies the status of the subnet. The value can be `ACTIVE`, `DOWN`, `UNKNOWN`, or `ERROR`.<br/>* `subnet_id` - Specifies the OpenStack subnet ID.<br/>* `network_id` - Specifies the OpenStack network ID.<br/>* `cidr_v6` - Specifies the IPv6 subnet CIDR block. If the subnet is an IPv4 subnet, this parameter is not returned.<br/>* `gateway_ip_v6` - Specifies the IPv6 subnet gateway. If the subnet is an IPv4 subnet, this parameter is not returned.<br/><br/>Example output:<pre>output "name" {<br/>  value = module.module_name.vpc_subnet.name<br/>}</pre> |

## Modules

No modules.

## 🌐 Additional Information  

This module provides a flexible way to manage Subnets within OpenTelekomCloud, supporting key network features such as CIDR block configuration, availability zone selection, resource tagging, and customizable operation timeouts. It is designed to be used for both standalone subnet deployments and as a building block for larger network architectures.

## 📚 Resources

- [Terraform OpenTelekomCloud Subnet Resource](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources vpc\_subnet\_v1)  
- [OpenTelekomCloud Subnet Overview](https://docs.otc.t-systems.com/virtual-private-cloud/umn/vpc_and_subnet/subnet/index.html)  
- [Terraform OpenTelekomCloud Provider](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs)  

## ⚠️ Notes  

- Ensure CIDR blocks do not overlap with existing networks to prevent IP conflicts.  
- Subnets should be designed with future scalability in mind, including the allocation of secondary CIDR blocks if needed.  
- Tagging resources can help in organizing and tracking costs within your cloud environment.  
- Be aware of region-specific subnet limitations and quotas in OpenTelekomCloud when designing your network architecture.

## 🧾 License  

This module is released under the **Apache 2.0 License**. See the [LICENSE](./LICENSE) file for full details.
<!-- END OF PRE-COMMIT-OPENTOFU DOCS HOOK -->