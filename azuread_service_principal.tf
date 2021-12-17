
resource "azuread_service_principal" "bridgecrew_sp" {
  application_id = azuread_application.bridgecrew_app.application_id
}

resource "azuread_service_principal_password" "password" {
  service_principal_id = azuread_service_principal.bridgecrew_sp.id
  value                = random_string.password.result
  end_date             = "2099-01-01T01:02:03Z"
}
