resource "azurerm_resource_group" "myrg" {
  name     = local.rg_name
  location = var.resoure_group_config.rg_location
  tags = var.common_tags
}