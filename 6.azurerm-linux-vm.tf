# azurerm_linux_virtual_machine Creation
resource "azurerm_linux_virtual_machine" "mylinuxvm" {
  name                  = local.vm_name
  computer_name         = local.vm_name
  resource_group_name   = local.rg_name
  location              = azurerm_resource_group.myrg.location
  size                  = var.vm_info.sku_size 
  admin_username        = var.vm_info.admin_username 
  network_interface_ids = [azurerm_network_interface.mynic.id]
  disable_password_authentication = true
  
  admin_ssh_key {
    username   = var.vm_info.ssh_key_username 
    public_key = tls_private_key.myssh.public_key_openssh
  }

  os_disk {
    name                 = "${local.vm_name}-${var.vm_info.os_disk_name}"
    caching              = var.vm_info.os_disk_cache 
    storage_account_type = var.vm_info.os_disk_type 
    disk_size_gb         = var.vm_info.os_disk_size_gb 
  }

  source_image_reference {
    publisher = var.vm_info.os_image_publisher 
    offer     = var.vm_info.os_image_offer 
    sku       = var.vm_info.os_image_sku 
    version   = var.vm_info.os_image_version 
  }
  
  custom_data = var.custom_data 
  tags        = var.common_tags
}

# TLS Private key
resource "tls_private_key" "myssh" {
  algorithm = "RSA"
  rsa_bits = 4096  
}





