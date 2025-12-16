# Random string for unique naming
resource "random_string" "myrandom" {
  length  = 6
  upper   = false
  special = false
  numeric = false
}

# TLS private key for SSH
resource "tls_private_key" "myssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# ==============================
# Resource Group
# ==============================
resource "azurerm_resource_group" "myrg" {
  name     = local.rg_name
  location = var.resoure_group_config.rg_location
  tags     = var.common_tags
}

# ==============================
# Virtual Network & Subnets
# ==============================
resource "azurerm_virtual_network" "myvnet" {
  name                = local.virtual_network_name
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  address_space       = var.virtual_network_config.vnet_address_space
  tags                = var.common_tags
}

resource "azurerm_subnet" "mysubnet" {
  for_each             = var.virtual_network_config.subnets
  name                 = "${local.subnet_name}-${each.key}"
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = local.virtual_network_name
  address_prefixes     = [each.value]
}

# ==============================
# Public IP
# ==============================
resource "azurerm_public_ip" "myip" {
  name                = local.public_ip_name
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  allocation_method   = var.virtual_network_config.pu_ip_allocation_method
  domain_name_label   = lower("${var.virtual_network_config.pu_ip_domain_label}-${random_string.myrandom.result}")
  tags                = var.common_tags
}

# ==============================
# Network Interface
# ==============================
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

# ==============================
# Network Security Group
# ==============================
resource "azurerm_network_security_group" "mynsg" {
  name                = local.network_security_group_name
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location

  security_rule {
    name                       = "ssh-22"
    direction                  = "Inbound"
    priority                   = 100
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "22"
  }

  security_rule {
    name                       = "http-https"
    direction                  = "Inbound"
    priority                   = 200
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_ranges    = ["80","443"]
  }

  tags = var.common_tags
}

resource "azurerm_network_interface_security_group_association" "nsg-association" {
  network_interface_id      = azurerm_network_interface.mynic.id
  network_security_group_id = azurerm_network_security_group.mynsg.id
}

# ==============================
# Linux Virtual Machine
# ==============================
resource "azurerm_linux_virtual_machine" "mylinuxvm" {
  name                  = local.vm_name
  computer_name         = local.vm_name
  resource_group_name   = local.rg_name
  location              = azurerm_resource_group.myrg.location
  size                  = var.vm_info.sku_size
  network_interface_ids = [azurerm_network_interface.mynic.id]
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.vm_info.ssh_key_username
    public_key = var.ssh_public_key
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
