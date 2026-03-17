output "capacity_id" {
  description = "The ID of the Power BI embedded capacity."
  value       = azurerm_powerbi_embedded_capacity.power_bi_capacity.id
}

output "capacity_name" {
  description = "The name of the Power BI embedded capacity."
  value       = azurerm_powerbi_embedded_capacity.power_bi_capacity.name
}

output "sku_name" {
  description = "The SKU name of the Power BI embedded capacity."
  value       = azurerm_powerbi_embedded_capacity.power_bi_capacity.sku_name
}

output "administrators" {
  description = "The administrators of the Power BI embedded capacity."
  value       = azurerm_powerbi_embedded_capacity.power_bi_capacity.administrators
}

output "workspace_deployment_ids" {
  description = "The IDs of the workspace deployments."
  value = {
    for workspace_key, workspace in azurerm_resource_group_template_deployment.power_bi_workspaces : workspace_key => workspace.id
  }
}

output "location" {
  description = "The Azure region where the Power BI capacity is created."
  value       = azurerm_powerbi_embedded_capacity.power_bi_capacity.location
}
