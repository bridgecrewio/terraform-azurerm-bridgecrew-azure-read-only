output "subscription_id" {
  value = data.azurerm_subscription.subscription.id
}

output "tenant_id" {
  value = data.azurerm_subscription.subscription.tenant_id
}

output "client_id" {
  value = azuread_service_principal.bridgecrew_sp.application_id
}

output "client_secret" {
  value = random_string.password.result
}
