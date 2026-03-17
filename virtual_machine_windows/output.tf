output "name" {
  description = "The name of the virtual machine."
  value       = azurerm_windows_virtual_machine.windows_virtual_machine.name
  
}

output "location" {
  description = "The Azure region where the virtual machine is created."
  value       = azurerm_windows_virtual_machine.windows_virtual_machine.location   
  
}

output "id" {
  description = "The ID of the virtual machine."
  value       = azurerm_windows_virtual_machine.windows_virtual_machine.id
  
}

output "nic_id" {
  description = "The ID of the network interface associated with the virtual machine."
  value       = azurerm_network_interface.nic.id
  
}
