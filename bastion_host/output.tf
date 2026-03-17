output "id" {
  description = "The ID of the Bastion Host."
  value       = azurerm_bastion_host.bastion.id
}

output "name" {
  description = "The name of the Bastion Host."
  value       = azurerm_bastion_host.bastion.name
}

output "public_ip_id" {
  description = "The ID of the Public IP associated with the Bastion Host."
  value       = azurerm_public_ip.bastion_pip.id
}

output "public_ip_address" {
  description = "The IP address of the Public IP associated with the Bastion Host."
  value       = azurerm_public_ip.bastion_pip.ip_address
}

output "dns_name" {
  description = "The FQDN of the Public IP associated with the Bastion Host."
  value       = azurerm_public_ip.bastion_pip.fqdn
}
