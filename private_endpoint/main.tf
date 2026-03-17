resource "azurerm_private_endpoint" "endpoints" {
  for_each = var.private_endpoints

  name                = each.value.name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = each.value.subnet_id

  private_service_connection {
    name                           = each.value.private_service_connection_name
    private_connection_resource_id = each.value.private_connection_resource_id
    is_manual_connection           = try(each.value.is_manual_connection, false)
    subresource_names              = each.value.subresource_names
    request_message                = try(each.value.request_message, null)
  }

  private_dns_zone_group {
    name                 = try(each.value.private_dns_zone_group_name, "default")
    private_dns_zone_ids = each.value.private_dns_zone_ids
  }

  tags = var.tags
}
