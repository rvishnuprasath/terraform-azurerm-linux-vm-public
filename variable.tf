variable "bs_unit_env" {
  description = "Business unit and environment"
  type = object({
    bs_unit = string
    env     = string
  })
}

variable "resoure_group_config" {
  description = "Resource group configuration"
  type = object({
    rg_name     = string
    rg_location = string
  })
}

variable "virtual_network_config" {
  description = "VNET, subnet, NIC and public IP configuration"
  type = object({
    vnet_name                  = string
    vnet_address_space         = list(string)
    subnets                     = map(string)
    pu_ip_name                  = string
    pu_ip_allocation_method     = string
    pu_ip_domain_label          = string
    nsg_name                    = string
    nic_name                    = string
    nic_private_ip_allocation   = string
    nic_ip_config_name          = string
  })
}

variable "vm_info" {
  description = "Virtual machine configuration"
  type = object({
    az_vm_name         = string
    computer_name      = string
    sku_size           = string
    admin_username     = string
    ssh_key_username   = string
    os_disk_name       = string
    os_disk_size_gb    = number
    os_disk_type       = string
    os_disk_cache      = string
    os_image_publisher = string
    os_image_offer     = string
    os_image_sku       = string
    os_image_version   = string
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
  description = "Common tags for all resources"
  type        = map(string)
}

variable "random_suffix" {
  description = "Random string for unique naming"
  type        = string
}
