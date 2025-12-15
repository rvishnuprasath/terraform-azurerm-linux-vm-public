Perfect! Here’s a **fully polished, Terraform Registry-ready README** for your `terraform-azurerm-linux-vm-public` module, modeled after the professional style of the Azure `avm-res-network-virtualnetwork` module.

---

# Azure Linux Virtual Machine Module

**Provider:** azurerm
**Author / Partner:** Vishnuprasath R
**Source:** [GitHub](https://github.com/rvishnuprasath/terraform-azurerm-linux-vm-public)
**Terraform Registry:** [rvishnuprasath/linux-vm-public/azurerm](https://registry.terraform.io/modules/rvishnuprasath/linux-vm-public/azurerm/latest)
**Version:** 1.0.1

---

## Description

This module is used to **create and manage Azure Linux Virtual Machines** with configurable OS, networking, storage, and security options.

It is a **composite module** and includes a submodule:

* `linux-vm` — the primary submodule for creating Linux VMs.

> **Note:** The root module does not include any resources. Always use the submodule path:

```hcl
rvishnuprasath/linux-vm-public/azurerm//modules/linux-vm
```

---

## Features

* Create a Linux VM in Azure
* Attach VM to an existing virtual network and subnet
* Assign public IP and network interfaces
* Configure OS type, VM size, and managed disks
* Optional monitoring and diagnostic settings
* Assign tags for resource organization
* Support for non-root containers and security context

---

## Usage

### Basic Example

```hcl
module "linux_vm" {
  source  = "rvishnuprasath/linux-vm-public/azurerm//modules/linux-vm"
  version = "1.0.1"

  resource_group_name = "rg-example"
  location            = "centralindia"
  vm_name             = "vm-example"

  admin_username      = "azureuser"
  vm_size             = "Standard_B2s"
  os_disk_size_gb     = 30
  ssh_public_key      = file("~/.ssh/id_rsa.pub")
}
```

### Advanced Example

```hcl
module "linux_vm" {
  source  = "rvishnuprasath/linux-vm-public/azurerm//modules/linux-vm"
  version = "1.0.1"

  resource_group_name = "rg-prod"
  location            = "centralindia"
  vm_name             = "vm-prod"

  admin_username      = "prodadmin"
  vm_size             = "Standard_D4s_v3"
  os_disk_size_gb     = 64
  ssh_public_key      = file("~/.ssh/prod_rsa.pub")

  network_interface_ids = [azurerm_network_interface.nic.id]
  tags = {
    environment = "production"
    owner       = "devops-team"
  }
}
```

---

## Inputs

| Name                    | Description                             | Type         | Default          | Required |
| ----------------------- | --------------------------------------- | ------------ | ---------------- | -------- |
| `resource_group_name`   | Name of the Azure resource group        | string       | n/a              | yes      |
| `location`              | Azure region to deploy resources        | string       | n/a              | yes      |
| `vm_name`               | Name of the Linux VM                    | string       | n/a              | yes      |
| `admin_username`        | Admin username for the VM               | string       | `"azureuser"`    | no       |
| `vm_size`               | Size of the VM (e.g., `"Standard_B2s"`) | string       | `"Standard_B2s"` | no       |
| `os_disk_size_gb`       | Size of the OS disk in GB               | number       | `30`             | no       |
| `ssh_public_key`        | SSH public key for authentication       | string       | `null`           | no       |
| `network_interface_ids` | List of NIC IDs to attach to the VM     | list(string) | `[]`             | no       |
| `tags`                  | Tags to assign to the VM                | map(string)  | `{}`             | no       |

---

## Outputs

| Name      | Description                    |
| --------- | ------------------------------ |
| `vm_id`   | The ID of the created Linux VM |
| `vm_ip`   | Public IP address of the VM    |
| `vm_name` | Name of the created VM         |

---

## Requirements

* Terraform >= 1.9
* azurerm provider >= 4.0

---

## Notes

* The module **does not include a root configuration**; always use the submodule path.
* For multiple VMs or advanced setups, create a root module that wraps this submodule.

---

## Recommended Structure for Repo

```
terraform-azurerm-linux-vm-public/
├── README.md
├── LICENSE
└── modules/
    └── linux-vm/
        ├── 1.random-string.tf
        ├── 2.variables.tf
        ├── 3.locals.tf
        ├── 4.resource-group.tf
        ├── 5.virtual-network.tf
        ├── 6.azurerm-linux-vm.tf
        ├── 7.outputs.tf
        └── README.md
```

> ✅ **Tip:** Make sure `modules/linux-vm/README.md` contains the same usage examples, inputs, and outputs to avoid Terraform Registry marking it as an internal module.

---
