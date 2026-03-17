resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  name                = var.workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  retention_in_days   = var.retention_in_days
  daily_quota_gb      = var.daily_quota_gb
  internet_ingestion_enabled = var.internet_ingestion_enabled
  internet_query_enabled = var.internet_query_enabled

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "solutions" {
  for_each = var.solutions

  solution_name         = each.value.solution_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.log_analytics_workspace.id
  workspace_name        = azurerm_log_analytics_workspace.log_analytics_workspace.name

  plan {
    publisher = each.value.publisher
    product   = each.value.product
  }
}

resource "azurerm_log_analytics_saved_search" "saved_searches" {
  for_each = var.saved_searches

  name                       = each.key
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics_workspace.id
  query                      = each.value.query
  display_name               = each.value.display_name
  category                   = each.value.category

  tags = merge(
    var.tags,
    {
      saved_search = each.key
    }
  )
}

resource "azurerm_monitor_action_group" "action_groups" {
  for_each = var.action_groups

  name                = each.key
  resource_group_name = var.resource_group_name
  short_name          = each.value.short_name

  dynamic "email_receiver" {
    for_each = try(each.value.email_receivers, [])
    content {
      name                    = email_receiver.value.name
      email_address           = email_receiver.value.email_address
      use_common_alert_schema = try(email_receiver.value.use_common_alert_schema, false)
    }
  }

  dynamic "webhook_receiver" {
    for_each = try(each.value.webhook_receivers, [])
    content {
      name                    = webhook_receiver.value.name
      service_uri             = webhook_receiver.value.service_uri
      use_common_alert_schema = try(webhook_receiver.value.use_common_alert_schema, false)
    }
  }

  tags = var.tags
}

resource "azurerm_monitor_metric_alert" "metric_alerts" {
  for_each = var.metric_alerts

  name                = each.key
  resource_group_name = var.resource_group_name
  scopes              = [azurerm_log_analytics_workspace.log_analytics_workspace.id]
  description         = try(each.value.description, "")
  severity            = try(each.value.severity, 3)
  frequency           = try(each.value.frequency, "PT1M")
  window_size         = try(each.value.window_size, "PT5M")
  enabled             = try(each.value.enabled, true)

  dynamic "criteria" {
    for_each = [each.value.criteria]
    content {
      metric_name      = criteria.value.metric_name
      metric_namespace = criteria.value.metric_namespace
      operator         = criteria.value.operator
      threshold        = criteria.value.threshold
      aggregation      = try(criteria.value.aggregation, "Average")
    }
  }

  action {
    action_group_id = try(each.value.action_group_id, null)
  }

  tags = var.tags
}
