# 1. Output Values - Resource Group
output "resource_group_id" {
  description = "Resource Group ID"
  value = azurerm_resource_group.myrg.id  # # Argument Reference
}
output "resource_group_name" {
  description = "Resource Group name"
  value = azurerm_resource_group.myrg.name # Argument Reference
}
output "Vet_name" {
  value = azurerm_virtual_network.myvnet.name  
}