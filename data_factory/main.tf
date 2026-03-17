resource "azurerm_data_factory" "data_factory" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  identity {
    type = var.identity_type
  }

  managed_virtual_network_enabled = var.managed_virtual_network_enabled
  public_network_enabled          = var.public_network_enabled

  tags = var.tags
}
