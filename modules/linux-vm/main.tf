provider "azurerm" {
  features {}
}

module "linux_vm" {
  source = "rvishnuprasath/linux-vm-public/azurerm"

  bs_unit_env = { bs_unit="demo", env="uat" }

  resoure_group_config = {
    rg_name     = "rg-demo"
    rg_location = "East US"
  }

  virtual_network_config = {
    vnet_name                = "vnet-demo"
    vnet_address_space       = ["10.0.0.0/16"]
    subnets                   = { sub-web="10.0.1.0/24" }
    pu_ip_name                = "pubip-demo"
    pu_ip_allocation_method   = "Static"
    pu_ip_domain_label        = "demo-vm"
    nsg_name                  = "nsg-demo"
    nic_name                  = "nic-demo"
    nic_private_ip_allocation = "Dynamic"
    nic_ip_config_name        = "ipconfig1"
  }

  vm_info = {
    az_vm_name         = "vm1"
    computer_name      = "vm1"
    sku_size           = "Standard_B2ms"
    admin_username     = "azureuser"
    ssh_key_username   = "azureuser"
    os_disk_name       = "osdisk"
    os_disk_size_gb    = 64
    os_disk_type       = "Standard_LRS"
    os_disk_cache      = "ReadWrite"
    os_image_publisher = "canonical"
    os_image_offer     = "UbuntuServer"
    os_image_sku       = "22_04-lts"
    os_image_version   = "latest"
  }

  ssh_public_key = file("~/.ssh/id_rsa.pub")
  common_tags    = { environment = "uat" }
  random_suffix  = "abc123"
}

output "vm_public_ip" {
  value = module.linux_vm.vm_public_ip_address
}
