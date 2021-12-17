
locals {
  permissions_id_map = {
    application_id     = data.azuread_service_principal.graph.application_id
    display_name       = data.azuread_service_principal.graph.display_name
    app_roles          = { for p in data.azuread_service_principal.graph.app_roles : p.value => p.id }
    oauth2_permissions = { for p in data.azuread_service_principal.graph.oauth2_permissions : p.value => p.id }
  }
  roles_to_assign = ["Reader"]

  version = "0.2.1"
}
