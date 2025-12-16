output "vm-public-ip" {
  value = module.azure_vm.vm_public_ip_address
}
output "vm-username" {
  value = module.azure_vm.vm_username
}
output "vm-name" {
  value = var.vm_info.computer_name
}
output "ssh_private_key" {
  value     = tls_private_key.myssh.private_key_pem
  sensitive = true
}
