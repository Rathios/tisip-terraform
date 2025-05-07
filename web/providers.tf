
terraform {

  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.27.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }

  backend "azurerm" {
    resource_group_name  = "alex-rg-backend-tfstate"
    storage_account_name = "alexsa88m06c5qgm6di4u"
    container_name       = "tfstate"
    key                  = "web.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
