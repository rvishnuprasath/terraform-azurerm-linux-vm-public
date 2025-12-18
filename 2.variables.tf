

# Bussiness & ENV Details
variable "bs_unit_env" {
  type = object({
    bs_unit = "qu"
    env = "sit"
  }) 
}

# RG Info
variable "resoure_group_config" {
  type = object({
    rg_name = "rg1"
    rg_location = "Central India"
  })  
}

# VNET Info
variable "virtual_network_config" {
  type = object({
    vnet_name = "vnet"
    vnet_address_space = [ "10.0.0.0/16", "10.1.0.0/16" ]
    subnets = {
    "sub-web" = "10.0.1.0/24"
    "sub-app" = "10.0.2.0/24"
    "sub-odb" = "10.0.3.0/24"
    "new-sub" = "10.1.1.0/24"
  }
  nic_name = "vm-nic"
  nic_private_ip_allocation = "Dynamic"
  nsg_name = "vm-nsg"
  nic_ip_config_name = "Internal"
  
  pu_ip_name = "vm-pu-ip"
  pu_ip_allocation_method = "Static"
  pu_ip_domain_label = "app1"  
  
  })
}

# VM Info
variable "vm_info" {
  type = object({
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
    
  })  
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
  type = object({
    tse = "env"
  })
}
variable "random_suffix" { 
  type = string 
}