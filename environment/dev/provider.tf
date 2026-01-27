terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.45.0"
    }
  }

  # backend "azurerm" {
  #   resource_group_name = "r"
  #   storage_account_name = ""
  #   container_name = "tfstae"
  #   key = "dev.terrform.tfstate"

  # }
}

provider "azurerm" {
  features {}
  subscription_id = "ca2d764d-6af0-4ecc-8eaf-76bd3b666806"

}

