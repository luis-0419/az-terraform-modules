output "private_endpoint_ids" {
  description = "A map of private endpoint names to their IDs."
  value = {
    for key, endpoint in azurerm_private_endpoint.endpoints : endpoint.name => endpoint.id
  }
}

output "private_endpoints" {
  description = "A map of private endpoints with their details."
  value = {
    for key, endpoint in azurerm_private_endpoint.endpoints : key => {
      id                          = endpoint.id
      name                        = endpoint.name
      private_ip_address          = endpoint.private_service_connection[0].private_ip_address
      custom_dns_configs          = endpoint.custom_dns_configs
    }
  }
}

output "private_ip_addresses" {
  description = "A map of private endpoint names to their private IP addresses."
  value = {
    for key, endpoint in azurerm_private_endpoint.endpoints : endpoint.name => endpoint.private_service_connection[0].private_ip_address
  }
}
