# Resource for VNET Creation
resource "azurerm_virtual_network" "myvnet" {
  name                = local.virtual_network_name
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  address_space       = var.virtual_network_config.vnet_address_space
  tags                = var.common_tags
}

# Subnet Creation
resource "azurerm_subnet" "mysubnet" {
  depends_on = [ azurerm_virtual_network.myvnet ]
  for_each             = var.virtual_network_config.subnets
  name                 = "${local.subnet_name}-${each.key}"  # unique subnet name
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = local.virtual_network_name
  address_prefixes     = [each.value]   # CIDR block from map
}

# Public IP Creation
resource "azurerm_public_ip" "myip" {
  depends_on = [
    azurerm_virtual_network.myvnet,
    azurerm_subnet.mysubnet
  ]
  name                = local.public_ip_name
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  allocation_method   =  var.virtual_network_config.pu_ip_allocation_method
  domain_name_label   = lower("${var.virtual_network_config.pu_ip_domain_label}-${random_string.myrandom.result}") 
  tags                = var.common_tags
}

# NIC Creation
resource "azurerm_network_interface" "mynic" {
  name                = local.network_interface_name
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location

  ip_configuration {
    name                          = var.virtual_network_config.nic_ip_config_name
    subnet_id                     = azurerm_subnet.mysubnet["sub-web"].id
    private_ip_address_allocation = var.virtual_network_config.nic_private_ip_allocation
    public_ip_address_id          = azurerm_public_ip.myip.id
  }
  tags = var.common_tags
}

# NSG Creation
resource "azurerm_network_security_group" "mynsg" {
  name                = local.network_security_group_name
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  # Rule 1: SSH
  security_rule {
    direction                  = "Inbound" # Inbound or Outbound
    name                       = "ssh-22"  # Rule Name
    priority                   = 100       # Priority
    source_address_prefix      = "*"       # 
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "22"
    protocol                   = "Tcp"
    access                     = "Allow"
  }
  # Rule 2: HTTP and HTTPS
  security_rule {
    direction                  = "Inbound"    # Inbound or Outbound
    name                       = "http-https" # Rule Name
    priority                   = 200          # Priority
    source_address_prefix      = "*"          # 
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_ranges    = ["80", "443"]
    protocol                   = "Tcp"
    access                     = "Allow"
  }

  tags = var.common_tags
}

# 7 Resource for NSG association
resource "azurerm_network_interface_security_group_association" "nsg-association" {
  network_interface_id      = azurerm_network_interface.mynic.id
  network_security_group_id = azurerm_network_security_group.mynsg.id
}
