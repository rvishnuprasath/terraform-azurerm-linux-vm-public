# VNet Submodule

This module creates an Azure Virtual Network and related resources.
It is intended for public use as a standalone module.

## Usage

```hcl
module "vnet" {
  source = "rvishnuprasath/linux-vm-public/azurerm//modules/vnet"
}
