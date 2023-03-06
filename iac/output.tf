output "postgresql_server" {
  sensitive = true
  value = azurerm_postgresql_server.postgresql-server
}