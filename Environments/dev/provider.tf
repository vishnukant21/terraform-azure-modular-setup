terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.56.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "ce5f86d2-b2e0-4edf-b803-7374190f47f5"
}