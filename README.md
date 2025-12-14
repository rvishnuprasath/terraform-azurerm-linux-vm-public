# azurerm-linux-virtual-machine

This module creates an Azure Linux Virtual Machine with the following features:

- Custom VM size
- Admin username & SSH key
- OS disk configuration
- Custom cloud-init script
- Network interface integration
- Tags

## Usage

```hcl
module "linux_vm" {
  source  = "rvishnuprasath/linux-vm-public/azurerm"
  version = "1.0.0"

  ssh_public_key = file("~/.ssh/id_rsa.pub")
  custom_data    = filebase64("cloud-init.txt")

  vm_info = {
    sku_size         = "Standard_B2ms"
    admin_username  = "azuser"
    ssh_key_username = "azuser"
    os_disk_name     = "osdisk"
    os_disk_cache    = "ReadWrite"
    os_disk_type     = "Standard_LRS"
    os_disk_size_gb  = 64
    os_image_publisher = "Canonical"
    os_image_offer     = "ubuntu-24_04-lts"
    os_image_sku       = "server"
    os_image_version   = "latest"
  }

  common_tags = {
    Environment = "dev"
    Owner       = "rvishnuprasath"
  }
}
