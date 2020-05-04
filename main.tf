provider "azuread" {
  subscription_id = var.subscription_id
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

resource random_string "password" {
  min_special = 2
  length      = 16
  min_lower   = 1
  min_numeric = 1
  min_upper   = 1
}

resource "azuread_application" "bridgecrew_app" {
  name                       = "bridgecrew-security"
  homepage                   = "http://bridgecrew.io"
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
}

resource "azuread_service_principal" "bridgecrew_sp" {
  application_id               = azuread_application.bridgecrew_app.application_id
  app_role_assignment_required = false
}

resource "azuread_service_principal_password" "password" {
  service_principal_id = azuread_service_principal.bridgecrew_sp.id
  value                = random_string.password.result
  end_date             = "2099-01-01T01:02:03Z"
}

data "azurerm_subscription" "subscription" {}

resource "azurerm_role_assignment" "example" {
  scope                = data.azurerm_subscription.subscription.id
  role_definition_name = "Security Reader"
  principal_id         = azuread_service_principal.bridgecrew_sp.object_id
}
