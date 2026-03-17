output "id" {
  description = "The ID of the Data Factory."
  value       = azurerm_data_factory.data_factory.id
}

output "name" {
  description = "The name of the Data Factory."
  value       = azurerm_data_factory.data_factory.name
}

output "identity_principal_id" {
  description = "The Principal ID of the system assigned managed identity."
  value       = azurerm_data_factory.data_factory.identity[0].principal_id
}

output "identity_tenant_id" {
  description = "The Tenant ID of the system assigned managed identity."
  value       = azurerm_data_factory.data_factory.identity[0].tenant_id
}
