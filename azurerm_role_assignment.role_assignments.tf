resource "azurerm_role_assignment" "role_assignments" {
  count                = length(local.roles_to_assign)
  scope                = data.azurerm_subscription.subscription.id
  role_definition_name = local.roles_to_assign[count.index]
  principal_id         = azuread_service_principal.bridgecrew_sp.object_id
}
