# Bussiness & ENV Details
variable "bs_unit_env" {
  type = ooptional(bject({
    bs_unit = optional(string)
    env = optional(string)
  })) 
}

# RG Info
variable "resoure_group_config" {
  type = optional(object({
    rg_name = optional(string)
    rg_location = optional(string)
  }))  
}

# VNET Info
variable "virtual_network_config" {
  type = optional(object({
    vnet_name = optional(string)
    vnet_address_space = optional(list(string))
    subnets = optional(map(string))
    
    pu_ip_name = optional(string)
    pu_ip_allocation_method = optional(string)
    pu_ip_domain_label  = optional(string)
    
    nsg_name = optional(string)

    nic_name = optional(string)
    nic_private_ip_allocation = optional(string)
    nic_ip_config_name = optional(string)
  }))
}

# VM Info
variable "vm_info" {
  type = optional(object({
    az_vm_name = optional(string)
    computer_name = optional(string)
    sku_size = optional(string)
    admin_username = optional(string)
    ssh_key_username = optional(string)
    os_disk_name = optional(string)
    os_disk_size_gb = optional(number)
    os_disk_type = optional(string)
    os_disk_cache      = optional(string)
    os_image_publisher = optional(string)
    os_image_offer     = optional(string)
    os_image_sku       = optional(string)
    os_image_version   = optional(string)
  }))  
}

variable "custom_data" {
  description = "Base64-encoded cloud-init custom data"
  type        = string
  default     = null
}
variable "common_tags" {
  type = optional(map(string))
}
variable "random_suffix" { 
  type = optional(string)
}