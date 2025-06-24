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
