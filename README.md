# terraform-azurerm-linux-vm-public

This repository contains Terraform modules for deploying **Azure Linux Virtual Machines** using the `azurerm` provider.

> **Note:** This root module has no Terraform configuration.  
> All resources are defined in the **submodule** `modules/linux-vm`.

---

## Usage

To deploy a Linux VM, reference the **submodule**:

```hcl
module "linux_vm" {
  source              = "rvishnuprasath/linux-vm-public/azurerm//modules/linux-vm"
  
  resource_group_name = "rg-example"
  location            = "centralindia"
  vm_name             = "vm-example"

  # Optional parameters
  admin_username      = "azureuser"
  vm_size             = "Standard_B2s"
  os_disk_size_gb     = 30
  ssh_public_key      = file("~/.ssh/id_rsa.pub")
}
