[33mcommit 10920fdda0ea9f31b2b7a8d368fbdcc9724d7204[m[33m ([m[1;36mHEAD[m[33m -> [m[1;32mmain[m[33m, [m[1;33mtag: [m[1;33mv1.0.1[m[33m, [m[1;31morigin/main[m[33m, [m[1;31morigin/HEAD[m[33m)[m
Author: Vishnuprasath  R <vishnuprasath.r@quadrasystems.net>
Date:   Mon Dec 15 11:01:07 2025 +0530

    4th commit

[1mdiff --git a/README.md b/README.md[m
[1mindex 7b5da99..e7edd9e 100644[m
[1m--- a/README.md[m
[1m+++ b/README.md[m
[36m@@ -1,16 +1,17 @@[m
[31m-# azurerm-linux-virtual-machine[m
[32m+[m[32m# Linux VM Module[m
 [m
[31m-This module creates a reusable **Azure Linux Virtual Machine** with supporting resources such as:[m
[32m+[m[32mThis module creates an Azure Linux Virtual Machine using the `azurerm` provider.[m
 [m
[31m-- Resource group[m
[31m-- Virtual network[m
[31m-- Network interface[m
[31m-- OS disk[m
[31m-- SSH access[m
[31m-- Cloud-init custom data[m
[31m-- Tags[m
[32m+[m[32mIt is designed to be consumed via the root module[m
[32m+[m[32m`rvishnuprasath/linux-vm-public/azurerm`.[m
 [m
[31m-> This module is **top-level** and can be used directly in Terraform Public Registry.[m
[32m+[m[32m## Usage[m
 [m
[31m----[m
[32m+[m[32m```hcl[m
[32m+[m[32mmodule "linux_vm" {[m
[32m+[m[32m  source = "rvishnuprasath/linux-vm-public/azurerm//modules/linux-vm"[m
 [m
[32m+[m[32m  resource_group_name = "rg-example"[m
[32m+[m[32m  location            = "centralindia"[m
[32m+[m[32m  vm_name             = "vm-example"[m
[32m+[m[32m}[m
[1mdiff --git a/modules/linux-vm/README.md b/modules/linux-vm/README.md[m
[1mindex 7b5da99..e7edd9e 100644[m
[1m--- a/modules/linux-vm/README.md[m
[1m+++ b/modules/linux-vm/README.md[m
[36m@@ -1,16 +1,17 @@[m
[31m-# azurerm-linux-virtual-machine[m
[32m+[m[32m# Linux VM Module[m
 [m
[31m-This module creates a reusable **Azure Linux Virtual Machine** with supporting resources such as:[m
[32m+[m[32mThis module creates an Azure Linux Virtual Machine using the `azurerm` provider.[m
 [m
[31m-- Resource group[m
[31m-- Virtual network[m
[31m-- Network interface[m
[31m-- OS disk[m
[31m-- SSH access[m
[31m-- Cloud-init custom data[m
[31m-- Tags[m
[32m+[m[32mIt is designed to be consumed via the root module[m
[32m+[m[32m`rvishnuprasath/linux-vm-public/azurerm`.[m
 [m
[31m-> This module is **top-level** and can be used directly in Terraform Public Registry.[m
[32m+[m[32m## Usage[m
 [m
[31m----[m
[32m+[m[32m```hcl[m
[32m+[m[32mmodule "linux_vm" {[m
[32m+[m[32m  source = "rvishnuprasath/linux-vm-public/azurerm//modules/linux-vm"[m
 [m
[32m+[m[32m  resource_group_name = "rg-example"[m
[32m+[m[32m  location            = "centralindia"[m
[32m+[m[32m  vm_name             = "vm-example"[m
[32m+[m[32m}[m
