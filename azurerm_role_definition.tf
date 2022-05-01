resource "azurerm_role_definition" "extra_read_permissions" {
  name  = "bridgecrew-extra-read-permissions"
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
