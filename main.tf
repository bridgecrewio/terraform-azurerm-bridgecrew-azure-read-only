resource random_string "password" {
  min_special      = 2
  length           = 16
  min_lower        = 1
  min_numeric      = 1
  min_upper        = 1
  override_special = "!#$@?^*%"
}

data "azurerm_subscription" "subscription" {}

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
    "Security Reader"
  ]

  version = "0.1.0"
}

resource "azuread_application" "bridgecrew_app" {
  name                       = "bridgecrew-security"
  homepage                   = "https://bridgecrew.io"
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true

  required_resource_access {
    resource_app_id = data.azuread_service_principal.graph.application_id
    resource_access {
      id   = local.permissions_id_map.oauth2_permissions["Directory.Read.All"]
      type = "Scope"
    }
  }
}

resource azuread_service_principal "bridgecrew_sp" {
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

resource null_resource "notify_bridgecrew" {
  triggers = {
    version = local.version
  }

  provisioner "local-exec" {
    command = <<CURL
      curl --request PUT 'https://w1w5hqge25.execute-api.us-west-2.amazonaws.com/v1/api/v1/integrations/csp' \
      --header 'Authorization: ${var.bridgecrew_token}' \
      --header 'Content-Type: application/json' \
      --data-raw '${jsonencode({"customerName": var.org_name,
                                "version": local.version,
                                "credentials": {
                                "subscriptionId": data.azurerm_subscription.subscription.subscription_id,
                                   "tenantId": data.azurerm_subscription.subscription.tenant_id,
                                    "clientId": azuread_application.bridgecrew_app.application_id,
                                     "clientSecret": azuread_service_principal_password.password.value}})}'
    CURL
  }

  depends_on = [azurerm_role_assignment.role_assignments]
}