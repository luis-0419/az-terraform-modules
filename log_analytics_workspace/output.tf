output "workspace_id" {
  description = "The ID of the Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.log_analytics_workspace.id
}

output "workspace_name" {
  description = "The name of the Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.log_analytics_workspace.name
}

output "primary_shared_key" {
  description = "The primary shared key for the Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.log_analytics_workspace.primary_shared_key
  sensitive   = true
}

output "secondary_shared_key" {
  description = "The secondary shared key for the Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.log_analytics_workspace.secondary_shared_key
  sensitive   = true
}

output "workspace_resource_id" {
  description = "The resource ID of the Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.log_analytics_workspace.workspace_resource_id
}

output "retention_in_days" {
  description = "The retention period in days for the Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.log_analytics_workspace.retention_in_days
}

output "solutions" {
  description = "The Log Analytics solutions deployed."
  value = {
    for solution_key, solution in azurerm_log_analytics_solution.solutions : solution_key => solution.id
  }
}

output "saved_searches" {
  description = "The saved searches created in the workspace."
  value = {
    for search_key, search in azurerm_log_analytics_saved_search.saved_searches : search_key => search.id
  }
}

output "action_groups" {
  description = "The action groups created for alerts."
  value = {
    for group_key, group in azurerm_monitor_action_group.action_groups : group_key => group.id
  }
}

output "metric_alerts" {
  description = "The metric alerts created."
  value = {
    for alert_key, alert in azurerm_monitor_metric_alert.metric_alerts : alert_key => alert.id
  }
}

output "sku" {
  description = "The SKU of the Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.log_analytics_workspace.sku
}

output "location" {
  description = "The Azure region where the Log Analytics workspace is located."
  value       = azurerm_log_analytics_workspace.log_analytics_workspace.location
}
