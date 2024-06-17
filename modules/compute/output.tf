# Displaying the Outputs

output "public_ips" {
  value = azurerm_public_ip.main[*].ip_address
}

output "internal_ips" {
  value = azurerm_network_interface.main[*].private_ip_address
}

