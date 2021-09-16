resource "azuread_application" "bridgecrew_app" {
  display_name               = "bridgecrew-security-${data.azurerm_subscription.subscription.subscription_id}"
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
