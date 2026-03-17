resource "azurerm_container_registry" "container_registry" {
  name                = var.registry_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = var.admin_enabled
  public_network_access_enabled = var.public_network_access_enabled

  tags = var.tags
}

resource "azurerm_container_registry_webhook" "webhooks" {
  for_each = var.webhooks

  name                = each.key
  resource_group_name = var.resource_group_name
  registry_name       = azurerm_container_registry.container_registry.name
  location            = var.location
  service_uri         = each.value.service_uri
  status              = each.value.status
  scope               = each.value.scope
  actions             = each.value.actions
  custom_headers      = each.value.custom_headers

  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "registry_diagnostics" {
  count                      = var.enable_diagnostics && var.log_analytics_workspace_id != null ? 1 : 0
  name                       = "${var.registry_name}-diagnostics"
  target_resource_id         = azurerm_container_registry.container_registry.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category = "ContainerRegistryRepositoryEvents"
  }

  enabled_log {
    category = "ContainerRegistryLoginEvents"
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}
