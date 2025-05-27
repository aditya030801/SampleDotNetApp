data "azuread_client_config" "current" {}

resource "azuread_application" "azureadapp" {
  display_name = "azureadapp"
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "azServprix" {
  client_id                    = azuread_application.azureadapp.client_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}