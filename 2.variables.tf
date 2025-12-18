
# Bussiness & ENV Details
variable "bs_unit_env" {
  type = object({
    bs_unit = string
    env     = string
  })
  default = {
    bs_unit = "qu"
    env = "sit"
  }
}

# RG Info
variable "resource_group_config" {
  type = object({
    rg_name     = string
    rg_location = string
  })
  default = {
    rg_location = "Central India"
    rg_name = "rg1"
  }
}


# VNET Info
variable "virtual_network_config" {
  type = object({
    vnet_name                    = string
    vnet_address_space           = list(string)
    subnets                      = map(string)
    nic_name                     = string
    nic_private_ip_allocation    = string
    nsg_name                     = string
    nic_ip_config_name           = string
    pu_ip_name                   = string
    pu_ip_allocation_method      = string
    pu_ip_domain_label           = string
  })
  default = {
    vnet_name = "vnet"
    vnet_address_space = [ "10.0.0.0/16", "10.1.0.0/16" ]
    subnets = {
      "web-app" = "10.0.1.0/24"
      "api-app" = "10.0.2.0/24"
      "dev-app" = "10.0.3.0/24"
      "new-sub" = "10.1.1.0/24"
    }
    nic_name = "vm-nic"
    nic_private_ip_allocation = "Dynamic"
    nic_ip_config_name = "Internal"
    nsg_name = "vm-nsg"
    
    pu_ip_name = "vm-ip"
    pu_ip_allocation_method = "Static"
    pu_ip_domain_label = "app1"
  }
}


# VM Info
variable "vm_info" {
  description = "Linux virtual machine configuration"
  type = object({
    az_vm_name         = string
    computer_name      = string
    admin_username     = string
    ssh_key_username   = string
    sku_size           = string
    os_disk_name       = string
    os_disk_cache      = string
    os_disk_size_gb    = number
    os_disk_type       = string
    os_image_offer     = string
    os_image_publisher = string
    os_image_sku       = string
    os_image_version   = string
  })
  default = {
    az_vm_name = "vm-app"
    computer_name = "vm-app"
    admin_username = "azuser"  
    ssh_key_username = "azuser"
    sku_size = "Standard_B2ms"
    os_disk_name = "os-disk"
    os_disk_cache = "ReadWrite"
    os_disk_size_gb = 64
    os_disk_type = "Standard_LRS"
    os_image_offer = "ubuntu-24_04-lts"
    os_image_publisher = "canonical"
    os_image_sku = "server"
    os_image_version = "latest"
  }
}
variable "ssh_public_key" {
  description = "SSH public key for Linux VM"
  type        = string
}
variable "custom_data" {
  description = "Base64-encoded cloud-init custom data"
  type        = string
  default     = null
}
variable "common_tags" {
  type = map(string)
  default = {
    "app" = "sit"
    "test" = "done"
  }
}
variable "random_suffix" {
  type        = string
  default     = null
  description = "Optional random suffix for resource naming"
}
