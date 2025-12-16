module "azure_vm" {
    source = "./modules/linux-vm"
    bs_unit_env = var.bs_unit_env
    resoure_group_config = var.resoure_group_config
    virtual_network_config = var.virtual_network_config
    vm_info = var.vm_info
    common_tags = var.common_tags
    random_suffix = random_string.myrandom.result
    ssh_public_key = var.ssh_public_key
    custom_data = var.custom_data
}