
resource "azurerm_virtual_network" "azurevnet" {
  depends_on          = [azurerm_resource_group.myrxgp01]
  name                = "udemyvnet"
  address_space       = ["10.0.0.0/16"]
  location            = "${var.rexloc}"
  resource_group_name = "${var.resource_group_name}"
}

resource "azurerm_subnet" "websubet01" {
  name                 = "azuresubnet"
  resource_group_name  = "${var.resource_group_name}"
  virtual_network_name = azurerm_virtual_network.azurevnet.name
  address_prefixes     = local.subnets[0].address_prefixes
}



