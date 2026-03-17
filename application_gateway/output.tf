output "id" {
  description = "The ID of the Application Gateway."
  value       = azurerm_application_gateway.appgw.id
}

output "public_ip_id" {
  description = "The ID of the public IP assigned to the Application Gateway."
  value       = azurerm_public_ip.appgw_pip.id
}

output "frontend_ip_configuration_id" {
  description = "The ID of the frontend IP configuration."
  value       = azurerm_application_gateway.appgw.frontend_ip_configuration[0].id
}

output "frontend_port_ids" {
  description = "A map of frontend port names to their IDs."
  value = {
    for port in azurerm_application_gateway.appgw.frontend_port : port.name => port.id
  }
}
