resource "azurerm_storage_account" "example" {
  name                     = "storageaccountnamefazz"
  resource_group_name      = "Test_synapse_murphy"
  location                 = "east us"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}