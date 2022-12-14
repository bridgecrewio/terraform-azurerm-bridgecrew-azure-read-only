
resource "null_resource" "notify_bridgecrew" {
  triggers = {
    version = local.version
    secret  = random_string.password.result
  }

  provisioner "local-exec" {
    command = <<CURL
      curl --request PUT '${var.bc_api_url}/api/v1/integrations/csp' \
      --header 'Authorization: ${var.bridgecrew_token}' \
      --header 'Content-Type: application/json' \
      --data-raw '${jsonencode({ "customerName" : var.org_name,
    "version" : local.version,
    "credentials" : {
      "subscriptionId" : data.azurerm_subscription.subscription.subscription_id,
      "subscriptionName" : data.azurerm_subscription.subscription.display_name,
      "tenantId" : data.azurerm_subscription.subscription.tenant_id,
      "clientId" : azuread_application.bridgecrew_app.application_id,
"clientSecret" : random_string.password.result } })}'
    CURL
      }

      depends_on = [azurerm_role_assignment.role_assignments]
      }
