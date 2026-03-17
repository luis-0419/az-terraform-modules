output "id" {
  description = "The ID of the Synapse Workspace."
  value       = azurerm_synapse_workspace.synapse.id
}

output "name" {
  description = "The name of the Synapse Workspace."
  value       = azurerm_synapse_workspace.synapse.name
}

output "connectivity_endpoints" {
  description = "The connectivity endpoints of the Synapse Workspace."
  value       = azurerm_synapse_workspace.synapse.connectivity_endpoints
}

output "identity_principal_id" {
  description = "The Principal ID of the system assigned managed identity."
  value       = azurerm_synapse_workspace.synapse.identity[0].principal_id
}

output "identity_tenant_id" {
  description = "The Tenant ID of the system assigned managed identity."
  value       = azurerm_synapse_workspace.synapse.identity[0].tenant_id
}
