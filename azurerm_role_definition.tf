resource "azurerm_role_definition" "extra_read_permissions" {
  name  = var.extra_read_permissions_role_name
  scope = data.azurerm_subscription.subscription.id

  permissions {
    actions = [
      "Microsoft.Storage/storageAccounts/listKeys/action",
      "Microsoft.ContainerRegistry/registries/listCredentials/action",
    ]
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_subscription.subscription.id
  ]
}
