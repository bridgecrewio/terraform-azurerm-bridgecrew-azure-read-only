resource "random_string" "password" {
  length      = 24
  min_lower   = 1
  min_numeric = 1
  min_upper   = 1
  special     = false
}

data "azurerm_subscription" "subscription" {
  subscription_id = var.subscription_id
}

data "azuread_service_principal" "graph" {
  display_name = "Microsoft Graph"
}

locals {
  permissions_id_map = {
    application_id     = data.azuread_service_principal.graph.application_id
    display_name       = data.azuread_service_principal.graph.display_name
    app_roles          = { for p in data.azuread_service_principal.graph.app_roles : p.value => p.id }
    oauth2_permissions = { for p in data.azuread_service_principal.graph.oauth2_permissions : p.value => p.id }
  }
  roles_to_assign = [
    "Reader",
  azurerm_role_definition.action_reader.name]

  version = "0.2.1"
}


resource "azuread_service_principal" "bridgecrew_sp" {
  application_id = azuread_application.bridgecrew_app.application_id
}

resource "azuread_service_principal_password" "password" {
  service_principal_id = azuread_service_principal.bridgecrew_sp.id
  value                = random_string.password.result
  end_date             = "2099-01-01T01:02:03Z"
}

resource "azurerm_role_assignment" "role_assignments" {
  count                = length(local.roles_to_assign)
  scope                = data.azurerm_subscription.subscription.id
  role_definition_name = local.roles_to_assign[count.index]
  principal_id         = azuread_service_principal.bridgecrew_sp.object_id
}
