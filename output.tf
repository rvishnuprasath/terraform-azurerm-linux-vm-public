# Resource Group Outputs
output "resource_group_id" {
  description = "Resource Group ID"
  value       = azurerm_resource_group.myrg.id
}

output "resource_group_name" {
  description = "Resource Group name"
  value       = azurerm_resource_group.myrg.name
}

# VM Outputs
output "vm_name" {
  description = "Virtual Machine name"
  value       = local.vm_name
}

output "vm_public_ip_address" {
  description = "Public IP address of the VM"
  value       = azurerm_linux_virtual_machine.mylinuxvm.public_ip_address
}

output "vm_username" {
  description = "Admin username for the VM"
  value       = azurerm_linux_virtual_machine.mylinuxvm.admin_username
}

# SSH Private Key (if module generated internally)
output "ssh_private_key" {
  description = "Private SSH key for VM (sensitive)"
  value       = tls_private_key.myssh.private_key_pem
  sensitive   = true
}
