output "registry_id" {
  description = "The ID of the container registry."
  value       = azurerm_container_registry.container_registry.id
}

output "registry_name" {
  description = "The name of the container registry."
  value       = azurerm_container_registry.container_registry.name
}

output "login_server" {
  description = "The URL that can be used to log into the container registry."
  value       = azurerm_container_registry.container_registry.login_server
}

output "admin_username" {
  description = "The username of the admin user if enabled."
  value       = var.admin_enabled ? azurerm_container_registry.container_registry.admin_username : null
}

output "admin_password" {
  description = "The password of the admin user if enabled. Sensitive value."
  value       = var.admin_enabled ? azurerm_container_registry.container_registry.admin_password : null
  sensitive   = true
}

output "webhook_ids" {
  description = "The IDs of the webhooks created."
  value = {
    for webhook_key, webhook in azurerm_container_registry_webhook.webhooks : webhook_key => webhook.id
  }
}

output "sku" {
  description = "The SKU of the container registry."
  value       = azurerm_container_registry.container_registry.sku
}

output "location" {
  description = "The Azure region where the container registry is created."
  value       = azurerm_container_registry.container_registry.location
}
