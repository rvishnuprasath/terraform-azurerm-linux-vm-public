# Azure Linux Virtual Machine – Terraform Module

**Provider:** azurerm  
**Author:** Vishnuprasath R  
**Source:** https://github.com/rvishnuprasath/terraform-azurerm-linux-vm-public  
**Terraform Registry:** https://registry.terraform.io/modules/rvishnuprasath/linux-vm-public/azurerm  

---

## Overview

This Terraform module provides a **composable and reusable way to deploy Azure Linux Virtual Machines** using the `azurerm` provider.

This repository follows the **Terraform recommended composite module pattern**.

---

## Module Structure

This repository contains:

- **Root module** – Documentation and module entry point
- **Submodule**
  - `modules/linux-vm` – Creates an Azure Linux Virtual Machine and required networking resources

> ⚠️ **Important**  
> The root module does **not** create resources directly.  
> Always reference the **submodule** when using this module.

---

## Usage

```hcl
module "linux_vm" {
  source  = "rvishnuprasath/linux-vm-public/azurerm//modules/linux-vm"
  version = "1.0.1"

  bs_unit_env = {
    bs_unit = "finance"
    env     = "dev"
  }

  resoure_group_config = {
    rg_name     = "rg-dev-linuxvm"
    rg_location = "centralindia"
  }

  virtual_network_config = {
    vnet_name          = "vnet-dev"
    vnet_address_spcae = ["10.0.0.0/16"]
    subnets            = { default = "10.0.1.0/24" }

    pu_ip_name                = "pip-dev"
    pu_ip_allocation_method   = "Static"
    pu_ip_domain_label        = "linuxvm-dev"

    nsg_name                  = "nsg-dev"

    nic_name                  = "nic-dev"
    nic_private_ip_allocation = "Dynamic"
    nic_ip_config_name        = "ipconfig1"
  }

  vm_info = {
    az_vm_name         = "linuxvm-dev"
    computer_name      = "linuxvm-dev"
    sku_size           = "Standard_B2s"
    admin_username     = "azureuser"
    ssh_key_username   = "azureuser"
    os_disk_name       = "osdisk-dev"
    os_disk_size_gb    = 30
    os_disk_type       = "Standard_LRS"
    os_disk_cache      = "ReadWrite"
    os_image_publisher = "Canonical"
    os_image_offer     = "0001-com-ubuntu-server-jammy"
    os_image_sku       = "22_04-lts"
    os_image_version   = "latest"
  }

  ssh_public_key = file("~/.ssh/id_rsa.pub")

  common_tags = {
    environment = "dev"
    owner       = "platform-team"
  }
}


Requirements:
Terraform >= 1.9
azurerm provider >= 4.0