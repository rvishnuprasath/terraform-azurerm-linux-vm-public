# Linux VM Module

This module creates an Azure Linux Virtual Machine using the `azurerm` provider.

It is designed to be consumed via the root module
`rvishnuprasath/linux-vm-public/azurerm`.

## Usage

```hcl
module "linux_vm" {
  source = "rvishnuprasath/linux-vm-public/azurerm//modules/linux-vm"

  resource_group_name = "rg-example"
  location            = "centralindia"
  vm_name             = "vm-example"
}
