output "peering_ids" {
  description = "A map of peering names to their IDs."
  value = {
    for key, peering in azurerm_virtual_network_peering.peerings : peering.name => peering.id
  }
}

output "peerings" {
  description = "A map of peerings with their details."
  value = {
    for key, peering in azurerm_virtual_network_peering.peerings : key => {
      id                          = peering.id
      name                        = peering.name
      remote_virtual_network_id   = peering.remote_virtual_network_id
      allow_virtual_network_access = peering.allow_virtual_network_access
      allow_forwarded_traffic      = peering.allow_forwarded_traffic
      allow_gateway_transit        = peering.allow_gateway_transit
      use_remote_gateways          = peering.use_remote_gateways
    }
  }
}
