output "vnet_id" {
  description = "The ID of the virtual network."
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "The name of the virtual network."
  value       = azurerm_virtual_network.vnet.name
}

output "subnets" {
  description = "A map of subnet IDs and details."
  value = {
    for key, subnet in azurerm_subnet.subnets : key => {
      id               = subnet.id
      name             = subnet.name
      address_prefixes = subnet.address_prefixes
    }
  }
}

output "subnet_ids" {
  description = "A map of subnet names to their IDs."
  value = {
    for key, subnet in azurerm_subnet.subnets : subnet.name => subnet.id
  }
}
