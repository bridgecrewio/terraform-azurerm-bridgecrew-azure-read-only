output "bridgecrew_output" {
  value = jsonencode({
    "subscriptionId"   = data.azurerm_subscription.subscription.subscription_id
    "subscriptionName" = data.azurerm_subscription.subscription.display_name
    "tenantId"         = data.azurerm_subscription.subscription.tenant_id
    "clientId"         = azuread_application.bridgecrew_app.application_id
  })
}

output "graph" {
  value = data.azuread_service_principal.graph.oauth2_permissions
}
