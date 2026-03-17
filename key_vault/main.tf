resource "azurerm_key_vault" "key_vault" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id
  sku_name            = var.sku_name

  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption      = var.enabled_for_disk_encryption
  enabled_for_template_deployment  = var.enabled_for_template_deployment
  rbac_authorization_enabled       = var.rbac_authorization_enabled
  purge_protection_enabled         = var.purge_protection_enabled
  soft_delete_retention_days       = var.soft_delete_retention_days

  network_acls {
    default_action             = var.network_acls.default_action
    bypass                     = var.network_acls.bypass
    virtual_network_subnet_ids = try(var.network_acls.virtual_network_subnet_ids, [])
    ip_rules                   = try(var.network_acls.ip_rules, [])
  }

  tags = var.tags
}

resource "azurerm_key_vault_access_policy" "policies" {
  for_each = var.access_policies

  key_vault_id       = azurerm_key_vault.key_vault.id
  tenant_id          = var.tenant_id
  object_id          = each.value.object_id

  key_permissions         = try(each.value.key_permissions, [])
  secret_permissions      = try(each.value.secret_permissions, [])
  certificate_permissions = try(each.value.certificate_permissions, [])
  storage_permissions     = try(each.value.storage_permissions, [])
}
