# Terraform 1Password CLI Module

This Terraform module installs and configures the 1Password CLI (op) tool.

## Overview

This module manages the installation and configuration of the 1Password CLI (op) tool on Linux systems. It provides a streamlined way to integrate 1Password CLI capabilities into your infrastructure.

## Requirements

- Terraform >= 1.0.0
- Linux operating system
- Internet connectivity for downloading the 1Password CLI

## Usage

Basic usage example:

```hcl
module "onepassword-cli-installer" {
  source  = "cesarine-com/1password-cli-installer/onepassword"
  version = "0.1.1"
}
```

every terraform resources that uses 1password provider should depend on this module.

```hcl
resource "onepassword_item" "example" {
  # ...
  depends_on = [module.onepassword-cli-installer]
}
```

This modules also provides output variables that can be used to get the path to the op binary.

```hcl
provider "onepassword" {
  # ...
  op_cli_path           = module.onepassword-cli-installer.op_cli_path
}
```
