# Resource Naming 
locals {
  rg_name   = "${var.bs_unit_env.bs_unit}-${var.bs_unit_env.env}-${terraform.workspace}-${var.resoure_group_config.rg_name}"
  vm_name   = "${var.bs_unit_env.bs_unit}-${var.bs_unit_env.env}-${terraform.workspace}-${var.vm_info.az_vm_name}"
  virtual_network_name = "${var.bs_unit_env.bs_unit}-${var.bs_unit_env.env}-${terraform.workspace}-${var. virtual_network_config.vnet_name}"
  network_interface_name  = "${var.bs_unit_env.bs_unit}-${var.bs_unit_env.env}-${terraform.workspace}-${var.virtual_network_config.nic_name}"
  public_ip_name  = "${var.bs_unit_env.bs_unit}-${var.bs_unit_env.env}-${terraform.workspace}-${var.virtual_network_config.pu_ip_name}"
  network_security_group_name  = "${var.bs_unit_env.bs_unit}-${var.bs_unit_env.env}-${terraform.workspace}-${var.virtual_network_config.nsg_name}" 
  subnet_name = "${var.bs_unit_env.bs_unit}-${var.bs_unit_env.env}-${terraform.workspace}"
}

