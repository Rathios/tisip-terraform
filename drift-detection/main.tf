
resource "random_string" "sa_suffix" {
  length  = 5
  special = false
  upper   = false
  numeric = true
}

# Resource Group
resource "azurerm_resource_group" "main" {
  name     = local.rg_name
  location = var.location

  tags = local.common_tags
}

# App Service Plan
resource "azurerm_service_plan" "main" {
  name                = local.app_service_plan
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  os_type             = "Linux"
  sku_name            = "B1"

  tags = local.common_tags
}

# Web App
resource "azurerm_linux_web_app" "main" {
  name                = local.web_app_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  service_plan_id     = azurerm_service_plan.main.id

  site_config {
    application_stack {
      node_version = "20-lts"
    }
  }

  app_settings = {
    "WEBSITE_NODE_DEFAULT_VERSION" = "~20"
    "ENVIRONMENT"                  = var.environment
    "NODE_ENV"                     = var.environment
  }

  tags = local.common_tags
}

# Storage Account
resource "azurerm_storage_account" "main" {
  name                     = local.sa_name
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  tags = local.common_tags
}

# Application Insights
resource "azurerm_application_insights" "main" {
  name                = local.app_insights_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  application_type    = "web"

  tags = local.common_tags
}
