# 1. Output Values - Resource Group
output "resource_group_id" {
  description = "Resource Group ID"
  value = azurerm_resource_group.myrg.id  # # Argument Reference
}
output "resource_group_name" {
  description = "Resource Group name"
  value = azurerm_resource_group.myrg.name # Argument Reference
}

output "vm_public_ip_address" {
  value = azurerm_linux_virtual_machine.mylinuxvm.public_ip_address
}

output "vm_username" {
  value = azurerm_linux_virtual_machine.mylinuxvm.admin_username
}


