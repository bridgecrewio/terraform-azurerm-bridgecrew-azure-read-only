output "bridgecrew_output" {
  value = jsonencode({
    "subscriptionId"   = data.azurerm_subscription.subscription.subscription_id
    "subscriptionName" = data.azurerm_subscription.subscription.display_name
    "tenantId"         = data.azurerm_subscription.subscription.tenant_id
    "clientId"         = azuread_application.bridgecrew_app.application_id
  })
}

output "app_permissions" {
  value = local.permissions_id_map.oauth2_permissions["Directory.Read.All"]
}

output "all_permissions" {
  value = local.permissions_id_map.oauth2_permissions
}

output "bridgecrew_app" {
  value = azuread_application.bridgecrew_app
}

output "service_principal" {
  value = azuread_service_principal.bridgecrew_sp
}
