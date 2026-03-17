output "firewall_id" {
  description = "The ID of the Azure Firewall."
  value       = azurerm_firewall.azure_firewall.id
}

output "firewall_name" {
  description = "The name of the Azure Firewall."
  value       = azurerm_firewall.azure_firewall.name
}

output "public_ip_address" {
  description = "The public IP address of the Azure Firewall."
  value       = azurerm_public_ip.firewall_pip.ip_address
}

output "public_ip_id" {
  description = "The ID of the public IP address."
  value       = azurerm_public_ip.firewall_pip.id
}

output "nat_rule_collection_ids" {
  description = "The IDs of the NAT rule collections."
  value = {
    for key, rule in azurerm_firewall_nat_rule_collection.nat_rules : key => rule.id
  }
}

output "network_rule_collection_ids" {
  description = "The IDs of the network rule collections."
  value = {
    for key, rule in azurerm_firewall_network_rule_collection.network_rules : key => rule.id
  }
}

output "app_rule_collection_ids" {
  description = "The IDs of the application rule collections."
  value = {
    for key, rule in azurerm_firewall_application_rule_collection.app_rules : key => rule.id
  }
}

output "private_ip_address" {
  description = "The private IP address of the firewall."
  value       = azurerm_firewall.azure_firewall.ip_configuration[0].private_ip_address
}
