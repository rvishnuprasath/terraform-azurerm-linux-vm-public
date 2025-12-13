# azurerm_linux_virtual_machine Creation
resource "azurerm_linux_virtual_machine" "mylinuxvm" {
  name                  = local.vm_name
  computer_name         = local.vm_name
  resource_group_name   = local.rg_name
  location              = azurerm_resource_group.myrg.location
  size                  = var.vm_info.sku_size # "Standard_B2ms"
  admin_username        = var.vm_info.admin_username # "azuser"
  network_interface_ids = [azurerm_network_interface.mynic.id]
  admin_ssh_key {
    username   = var.vm_info.ssh_key_username # "azuser"
    public_key = file("${path.module}/ssh-key/terraform-azure.pub") # public Key Location
  }
  os_disk {
    name                 = "${local.vm_name}-${var.vm_info.os_disk_name}"
    caching              = var.vm_info.os_disk_cache # "ReadWrite"
    storage_account_type = var.vm_info.os_disk_type # "Standard_LRS"
    disk_size_gb         = var.vm_info.os_disk_size_gb # "64" #  Add your desired OS disk size here (in GB), Default: If omitted, Azure uses the default OS disk size for that image (usually 30 GB for Ubuntu).
  }
  source_image_reference {
    publisher = var.vm_info.os_image_publisher # "canonical"
    offer     = var.vm_info.os_image_offer # "ubuntu-24_04-lts"
    sku       = var.vm_info.os_image_sku # "server"
    version   = var.vm_info.os_image_version # "latest"
  }
  custom_data = filebase64("${path.module}/app-script/custom-data-app1-ubuntu-cloud-init.txt")
  tags        = var.common_tags
}


