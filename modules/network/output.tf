# Displaying the Output

output "vnet_name" {
  value = azurerm_virtual_network.main.name
}

output "subnet_ids" {
  value = azurerm_subnet.main[*].id
}

