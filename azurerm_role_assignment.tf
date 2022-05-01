resource "azurerm_role_assignment" "role_assignments" {
  count                = length(local.roles_to_assign)
  scope                = data.azurerm_subscription.subscription.id
  role_definition_name = local.roles_to_assign[count.index]
  principal_id         = azuread_service_principal.bridgecrew_sp.object_id
}

resource "azurerm_role_assignment" "extra_read_assignment" {
  principal_id       = azuread_service_principal.bridgecrew_sp.object_id
  scope              = data.azurerm_subscription.subscription.id
  role_definition_id = azurerm_role_definition.extra_read_permissions.role_definition_resource_id
}
