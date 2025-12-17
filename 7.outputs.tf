# 1. Output Values - Resource Group
output "resource_group_name" {
  description = "Resource Group name"
  value = var.resoure_group_config.rg_name 
}
output "vm_public_ip_address" {
  value = azurerm_linux_virtual_machine.mylinuxvm.public_ip_address
}
output "az_vm_name" {
  value = var.vm_info.az_vm_name
}
output "admin_username" {
  value = azurerm_linux_virtual_machine.mylinuxvm.admin_username
}
output "ssh_private_key" {
  value     = tls_private_key.myssh.private_key_pem
  sensitive = true
}
