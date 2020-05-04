output "bridgecrew_output" {
  value = jsonencode({
    "subscription_id" = data.azurerm_subscription.subscription.subscription_id
    "tenant_id"       = data.azurerm_subscription.subscription.tenant_id
    "client_id"       = azuread_service_principal.bridgecrew_sp.application_id
    "client_secret"   = random_string.password.result
  })
}
