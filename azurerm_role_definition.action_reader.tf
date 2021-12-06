resource "azurerm_role_definition" "action_reader" {
  name        = "bridgecrew-action-reader"
  scope       = data.azurerm_subscription.subscription.id
  description = "This is a custom role created via Terraform"

  permissions {
    actions = [
      "Microsoft.Storage/storageAccounts/listKeys/action",
      "Microsoft.Web/sites/config/list/action",
    "Microsoft.ContainerRegistry/registries/listCredentials/action"]
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_subscription.subscription.id
  ]
}
