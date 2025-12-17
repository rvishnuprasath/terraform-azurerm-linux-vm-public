# Bussiness & ENV Details
variable "bs_unit_env" {
  type = object({
    bs_unit = string
    env = string
  }) 
  nullable = true
}

# RG Info
variable "resoure_group_config" {
  type = object({
    rg_name = string
    rg_location = string
  })  
  nullable = true
}

# VNET Info
variable "virtual_network_config" {
  type = object({
    vnet_name = string
    vnet_address_space = list(string)
    subnets = map(string)
    
    pu_ip_name = string
    pu_ip_allocation_method = string
    pu_ip_domain_label  = string
    
    nsg_name = string

    nic_name = string
    nic_private_ip_allocation = string
    nic_ip_config_name = string
  })
  nullable = true
}

variable "common_tags" {
  type = map(string)
  nullable = true  
}
variable "random_suffix" { 
  type = string 
  nullable = true
}


# VM Info
variable "vm_info" {
  type = object({
    az_vm_name = string
    computer_name = string
    sku_size = string
    admin_username = string
    ssh_key_username = string
    os_disk_name = string
    os_disk_size_gb = number
    os_disk_type = string
    os_disk_cache      = string
    os_image_publisher = string
    os_image_offer     = string
    os_image_sku       = string
    os_image_version   = string
  })  
  nullable = true
}

variable "ssh_public_key" {
  description = "SSH public key for Linux VM"
  type        = string
  nullable = true
}
variable "custom_data" {
  description = "Base64-encoded cloud-init custom data"
  type        = string
  default     = null
}

# submodule → REMOVE random_string
variable "random_suffix" {
  type = string
}
