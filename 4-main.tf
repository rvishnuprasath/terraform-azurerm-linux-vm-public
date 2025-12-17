# VM , vne,nic,nsg all resources

# Random String Resource
resource "random_string" "myrandom" {
  length  = 6
  upper   = false
  special = false
  numeric = false
}


# TLS Private key
resource "tls_private_key" "myssh" {
  algorithm = "RSA"
  rsa_bits = 4096  
}

module "azure_vm" {
    source = "./modules/linux_vm_network"
    
    bs_unit_env = var.bs_unit_env
    resoure_group_config = var.resoure_group_config
    virtual_network_config = var.virtual_network_config
    vm_info = var.vm_info

    common_tags = var.common_tags
    random_suffix = random_string.myrandom.result
    ssh_public_key = tls_private_key.myssh.public_key_openssh 
}