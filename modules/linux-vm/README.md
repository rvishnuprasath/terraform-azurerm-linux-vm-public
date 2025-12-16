
---

## 📄 2️⃣ Submodule `modules/linux-vm/README.md` (copy this as-is)

```md
# Azure Linux Virtual Machine Submodule

This submodule provisions an **Azure Linux Virtual Machine** along with networking and security components.

---

## Usage

```hcl
module "linux_vm" {
  source = "rvishnuprasath/linux-vm-public/azurerm//modules/linux-vm"

  bs_unit_env = {
    bs_unit = "finance"
    env     = "prod"
  }

  resoure_group_config = {
    rg_name     = "rg-prod-linuxvm"
    rg_location = "centralindia"
  }

  virtual_network_config = {
    vnet_name          = "vnet-prod"
    vnet_address_spcae = ["10.10.0.0/16"]
    subnets            = { default = "10.10.1.0/24" }

    pu_ip_name                = "pip-prod"
    pu_ip_allocation_method   = "Static"
    pu_ip_domain_label        = "linuxvm-prod"

    nsg_name                  = "nsg-prod"

    nic_name                  = "nic-prod"
    nic_private_ip_allocation = "Dynamic"
    nic_ip_config_name        = "ipconfig1"
  }

  vm_info = {
    az_vm_name         = "linuxvm-prod"
    computer_name      = "linuxvm-prod"
    sku_size           = "Standard_D2s_v3"
    admin_username     = "azureuser"
    ssh_key_username   = "azureuser"
    os_disk_name       = "osdisk-prod"
    os_disk_size_gb    = 64
    os_disk_type       = "Premium_LRS"
    os_disk_cache      = "ReadWrite"
    os_image_publisher = "Canonical"
    os_image_offer     = "0001-com-ubuntu-server-jammy"
    os_image_sku       = "22_04-lts"
    os_image_version   = "latest"
  }

  ssh_public_key = file("~/.ssh/prod_rsa.pub")

  common_tags = {
    environment = "prod"
    owner       = "devops"
  }
}

**Outputs**

| Name                   | Description          |
| ---------------------- | -------------------- |
| `vm_public_ip_address` | Public IP of the VM  |
| `vm_username`          | Admin username       |
| `vm_id`                | Azure VM resource ID |
