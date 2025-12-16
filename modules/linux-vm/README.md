# Linux VM Submodule – Terraform Module

**Provider:** `azurerm`
**Module Path:** `modules/linux-vm`

This submodule is responsible for **creating an Azure Linux Virtual Machine** along with its networking resources: VNET, Subnets, NIC, NSG, and Public IP.

> ⚠️ **Note:** This submodule is intended to be used through the **root module** or directly as a Terraform Registry module. Do **not** create resources outside the recommended usage pattern.

---

## Module Inputs

| Name                     | Type                                           | Description                                        | Required |
| ------------------------ | ---------------------------------------------- | -------------------------------------------------- | -------- |
| `bs_unit_env`            | object({ bs_unit=string, env=string })         | Business unit and environment                      | yes      |
| `resoure_group_config`   | object({ rg_name=string, rg_location=string }) | Resource Group name and location                   | yes      |
| `virtual_network_config` | object                                         | VNET, Subnet, NSG, NIC, and Public IP settings     | yes      |
| `vm_info`                | object                                         | VM configuration: size, OS, disk, admin user, etc. | yes      |
| `ssh_public_key`         | string                                         | Public SSH key for the Linux VM                    | yes      |
| `custom_data`            | string                                         | Base64-encoded cloud-init custom data              | no       |
| `common_tags`            | map(string)                                    | Common tags for all resources                      | no       |
| `random_suffix`          | string                                         | Random string for unique naming                    | no       |

---

## Module Outputs

| Name                   | Description                           |
| ---------------------- | ------------------------------------- |
| `resource_group_id`    | The Resource Group ID                 |
| `resource_group_name`  | The Resource Group name               |
| `vm_public_ip_address` | The public IP address of the Linux VM |
| `vm_username`          | Admin username for the VM             |

---

## Example Usage

```hcl
provider "azurerm" {
  features {}
}

module "linux_vm" {
  source  = "rvishnuprasath/linux-vm-public/azurerm//modules/linux-vm"
  version = "1.0.4"

  bs_unit_env = { bs_unit = "finance", env = "dev" }

  resoure_group_config = {
    rg_name     = "rg-dev-linuxvm"
    rg_location = "centralindia"
  }

  virtual_network_config = {
    vnet_name                = "vnet-dev"
    vnet_address_space       = ["10.0.0.0/16"]
    subnets                   = { default = "10.0.1.0/24" }
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
  common_tags    = { environment = "dev", owner = "platform-team" }
  random_suffix  = "abc123"
}

output "vm_public_ip" {
  value = module.linux_vm.vm_public_ip_address
}
```

---

