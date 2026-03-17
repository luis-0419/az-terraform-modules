resource "azurerm_mssql_server" "sql_server" {
  name                         = var.server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.sql_server_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password

  tags = var.tags
}

resource "azurerm_mssql_server_firewall_rule" "firewall_rule" {
  name             = "${var.server_name}-firewall"
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = var.start_ip_address
  end_ip_address   = var.end_ip_address
}

resource "azurerm_mssql_database" "databases" {
  for_each = var.databases

  name           = each.value.name
  server_id      = azurerm_mssql_server.sql_server.id
  collation      = each.value.collation
  license_type   = each.value.license_type
  max_size_gb    = each.value.max_size_gb
  sku_name       = each.value.sku_name
  zone_redundant = each.value.zone_redundant

  tags = merge(
    var.tags,
    {
      database_name = each.value.name
    }
  )
}
