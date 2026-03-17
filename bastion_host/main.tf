resource "azurerm_public_ip" "bastion_pip" {
  name                = "${var.name}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.bastion_sku

  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.bastion_subnet_id
    public_ip_address_id = azurerm_public_ip.bastion_pip.id
  }

  copy_paste_enabled           = var.copy_paste_enabled
  file_copy_enabled            = var.file_copy_enabled
  ip_connect_enabled           = var.ip_connect_enabled
  shareable_link_enabled       = var.shareable_link_enabled
  tunneling_enabled            = var.tunneling_enabled

  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "bastion_diagnostics" {
  count                      = var.enable_diagnostics && var.log_analytics_workspace_id != null ? 1 : 0
  name                       = "${var.name}-diagnostics"
  target_resource_id         = azurerm_bastion_host.bastion.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category = "BastionAuditLogs"
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}
