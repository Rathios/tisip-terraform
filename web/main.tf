
resource "random_string" "random_string" {
  length  = 5
  special = false
  upper   = false
}

resource "azurerm_resource_group" "rg_web" {
  name     = local.rg_web_name
  location = var.rg_web_location
}

resource "azurerm_storage_account" "sa_web" {
  name                     = "${lower(local.sa_web_name)}${random_string.random_string.result}"
  resource_group_name      = azurerm_resource_group.rg_web.name
  location                 = azurerm_resource_group.rg_web.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  static_website {
    index_document = var.index_document
  }
}

resource "azurerm_storage_blob" "index_html" {
  name                   = var.index_document
  storage_account_name   = azurerm_storage_account.sa_web.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "<html><body>${local.index_text}</body></html>"
}
