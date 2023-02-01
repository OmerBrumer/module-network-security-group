output "id" {
  description = "Id of NSG."
  value       = azurerm_network_security_group.nsg.id
}

output "name" {
  description = "Name of NSG."
  value       = azurerm_network_security_group.nsg.name
}

output "object" {
  description = "Object of NSG."
  value       = azurerm_network_security_group.nsg
}