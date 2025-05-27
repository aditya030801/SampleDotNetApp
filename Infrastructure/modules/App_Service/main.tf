resource "azurerm_service_plan" "ax_service_plan" {
  name                = "azr_serve"
  resource_group_name = azurerm_resource_group.rexgp.name
  location            = azurerm_resource_group.rexgp.location
  sku_name            = "P1v2"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "az_webApp" {
  name                = "dotnet_webapp"
  resource_group_name = azurerm_resource_group.rexgp.name
  location            = azurerm_service_plan.ax_service_plan.location
  service_plan_id     = azurerm_service_plan.ax_service_plan.id

  site_config {}
}