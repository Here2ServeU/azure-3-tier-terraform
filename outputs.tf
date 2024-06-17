# Displaying The Outputs

output "web_server_public_ips" {
  value = module.web_server.public_ips
}

output "app_server_internal_ips" {
  value = module.app_server.internal_ips
}

output "db_server_internal_ips" {
  value = module.db_server.internal_ips
}
