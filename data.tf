
data "azurerm_subscription" "subscription" {
  subscription_id = var.subscription_id
}

data "azuread_service_principal" "graph" {
  display_name = "Microsoft Graph"
}
