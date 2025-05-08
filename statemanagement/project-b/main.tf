
terraform {

  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.27.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "alex-rg-backend-tfstate"
    storage_account_name = "alexsa88m06c5qgm6di4u"
    container_name       = "tfstate"
    key                  = "statemanagement-project-b.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

### Modules

module "storage" {
  source   = "../modules/storage"
  sa_name  = var.sa_name
  rg_name  = azurerm_resource_group.rg_b.name
  location = azurerm_resource_group.rg_b.location
}

### Resources

resource "azurerm_resource_group" "rg_b" {
  name     = var.rg_name
  location = var.location
}
