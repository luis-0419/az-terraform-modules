resource "azurerm_synapse_workspace" "synapse" {
  name                                 = var.name
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  storage_data_lake_gen2_filesystem_id = var.storage_data_lake_gen2_filesystem_id
  sql_administrator_login              = var.sql_administrator_login
  sql_administrator_login_password     = var.sql_administrator_login_password

  identity {
    type = var.identity_type
  }

  managed_virtual_network_enabled = var.managed_virtual_network_enabled
  managed_resource_group_name     = var.managed_resource_group_name
  public_network_access_enabled   = var.public_network_access_enabled
  data_exfiltration_protection_enabled = var.data_exfiltration_protection_enabled

  sql_identity_control_enabled = var.sql_identity_control_enabled

  tags = var.tags
}

data "azurerm_client_config" "current" {}

data "azurerm_role_definition" "synapse_roles" {
  for_each = {
    for k, v in var.role_assignments : k => v
    if !contains(keys(v), "role_definition_id") && contains(keys(v), "role_definition_name")
  }

  name  = each.value.role_definition_name
  scope = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
}

resource "azurerm_role_assignment" "synapse_access" {
  for_each = var.role_assignments

  scope              = try(each.value.scope, azurerm_synapse_workspace.synapse.id)
  principal_id       = each.value.principal_id
  role_definition_id = try(each.value.role_definition_id, data.azurerm_role_definition.synapse_roles[each.key].id)
}
