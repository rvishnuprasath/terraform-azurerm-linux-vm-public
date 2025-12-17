terraform {
  required_version = ">= 1.13.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 4.49.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.7.1"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3.2.4"
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.13.1"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "~> 2.4"
    }
  }
}
