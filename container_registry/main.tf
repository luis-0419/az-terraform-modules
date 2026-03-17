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
