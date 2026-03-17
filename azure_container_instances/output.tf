output "container_group_ids" {
  description = "The IDs of the container groups created."
  value = {
    for group_key, group in azurerm_container_group.container_instances : group_key => group.id
  }
}

output "container_group_names" {
  description = "The names of the container groups created."
  value = {
    for group_key, group in azurerm_container_group.container_instances : group_key => group.name
  }
}

output "fqdns" {
  description = "The fully qualified domain names of the container groups."
  value = {
    for group_key, group in azurerm_container_group.container_instances : group_key => group.fqdn
  }
}

output "ip_addresses" {
  description = "The IP addresses of the container groups."
  value = {
    for group_key, group in azurerm_container_group.container_instances : group_key => group.ip_address
  }
}

output "locations" {
  description = "The Azure regions where the container groups are created."
  value = {
    for group_key, group in azurerm_container_group.container_instances : group_key => group.location
  }
}
