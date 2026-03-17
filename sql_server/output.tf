output "server_id" {
  description = "The ID of the SQL Server."
  value       = azurerm_mssql_server.sql_server.id
}

output "server_name" {
  description = "The name of the SQL Server."
  value       = azurerm_mssql_server.sql_server.name
}

output "server_fqdn" {
  description = "The fully qualified domain name of the SQL Server."
  value       = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}

output "database_ids" {
  description = "The IDs of the databases created."
  value = {
    for db_key, db in azurerm_mssql_database.databases : db_key => db.id
  }
}

output "database_names" {
  description = "The names of the databases created."
  value = {
    for db_key, db in azurerm_mssql_database.databases : db_key => db.name
  }
}

output "firewall_rule_id" {
  description = "The ID of the firewall rule."
  value       = azurerm_mssql_server_firewall_rule.firewall_rule.id
}
