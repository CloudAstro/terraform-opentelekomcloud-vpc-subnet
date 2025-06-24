## 🌐 Additional Information  

This module provides a flexible way to manage Subnets within OpenTelekomCloud, supporting key network features such as CIDR block configuration, availability zone selection, resource tagging, and customizable operation timeouts. It is designed to be used for both standalone subnet deployments and as a building block for larger network architectures.

## 📚 Resources

- [Terraform OpenTelekomCloud Subnet Resource](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources vpc_subnet_v1)  
- [OpenTelekomCloud Subnet Overview](https://docs.otc.t-systems.com/virtual-private-cloud/umn/vpc_and_subnet/subnet/index.html)  
- [Terraform OpenTelekomCloud Provider](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs)  

## ⚠️ Notes  

- Ensure CIDR blocks do not overlap with existing networks to prevent IP conflicts.  
- Subnets should be designed with future scalability in mind, including the allocation of secondary CIDR blocks if needed.  
- Tagging resources can help in organizing and tracking costs within your cloud environment.  
- Be aware of region-specific subnet limitations and quotas in OpenTelekomCloud when designing your network architecture.

## 🧾 License  

This module is released under the **Apache 2.0 License**. See the [LICENSE](./LICENSE) file for full details.
