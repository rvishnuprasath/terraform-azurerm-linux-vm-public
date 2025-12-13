# 1. Output Values - Resource Group
output "resource_group_id" {
  description = "Resource Group ID"
  value = azurerm_resource_group.myrg.id  # # Argument Reference
}
output "resource_group_name" {
  description = "Resource Group name"
  value = azurerm_resource_group.myrg.name # Argument Reference
}

# 3. Output Values - Virtual Machine Public IP Address
output "vm_public_ip_address" {
  description = "My Virtual Machine Public IP"
  value       = azurerm_linux_virtual_machine.mylinuxvm.public_ip_address
}

# 4. Output Values - Virtual Machine Username
output "vm_username" {
  description = "VM USERNAME"
  value       = azurerm_linux_virtual_machine.mylinuxvm.admin_username
}

