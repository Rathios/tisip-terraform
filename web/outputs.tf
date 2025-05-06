
output "primary_web_endpoint" {
  value = azurerm_storage_account.sa_web.primary_web_endpoint
}

output "rg_name" {
  value = azurerm_resource_group.rg_web.name
}
