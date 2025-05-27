resource "azurerm_key_vault" "Udemy_kv" {
  name                        = "udemy-kv1"
  location                    = azurerm_resource_group.myrxgp01.location
  resource_group_name         = azurerm_resource_group.myrxgp01.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id


    key_permissions = [
      "Purge",
      "Release",
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
    ]


  }
}