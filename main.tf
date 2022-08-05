/*provider "azurerm" {
  features {}
}*/
resource "azurerm_storage_account" "storage" {
  #name                     = "${var.storage_account_name}"
  resource_group_name      = var.resource_group
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  for_each                 = var.storage_accounts
  name                     = each.value["storage_account_name"]
  is_hns_enabled           = each.value["is_hns_enabled"]
   identity {
    type = "SystemAssigned"
  }
  network_rules {
    default_action = "Deny"
    /*private_link_access{
      endpoint_resource_id="${var.endpoint_resource_id}"
      }*/
  }
  blob_properties {
    delete_retention_policy {
      days = 7
    }
    container_delete_retention_policy {
      days = 7
    }
    versioning_enabled       = false
    last_access_time_enabled = true
    change_feed_enabled      = false
  }
  #allow_blob_public_access = false


  tags =  "${var.tags}"
  
}

/*
resource "azurerm_storage_account_customer_managed_key" "example" {
  storage_account_id = azurerm_storage_account.storage["one"].id
  key_vault_id       = "${var.storage_cmk_key_vault_id}"
  key_name           = "${var.storage_cmk_key_name}"
}


*/



/*resource "azurerm_storage_encryption_scope" "example" {
  name                               = "microsoftmanaged"
  storage_account_id                 = azurerm_storage_account.storage["one"].id
  source                             = "Microsoft.Storage"
  infrastructure_encryption_required = true
}
*/





/*resource "azurerm_storage_account" "example2" {
  name                     = "dlfjdlvkflvkjj22"
  resource_group_name      = "Shravani_HandsOn_Lab"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version="TLS1_2"
  
    
     blob_properties {
    delete_retention_policy {
      days = 7
    }
    container_delete_retention_policy {
      days = 7
    }
    versioning_enabled = false
    last_access_time_enabled = true
    change_feed_enabled = false
  }
  
  allow_blob_public_access =true
   
network_rules {
  default_action             = "Deny"
private_link_access{
      endpoint_resource_id="/subscriptions/f9f64129-c103-4fb5-a4b5-1e93865d3427/resourceGroups/Shravani_HandsOn_Lab/providers/Microsoft.KeyVault/vaults/IdeaLZKeyVaultnew045"
      }
      }
      
      is_hns_enabled =true

  tags = {
    environment = "staging"
  }
}
*/


#data "azurerm_client_config" "current" {}

/*
resource "azurerm_key_vault" "example" {
  name                = "examsdfvd"
  location            = "east us"
  resource_group_name = "Fasil_HandsOn_Lab"
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  purge_protection_enabled = true
}*/

/*resource "azurerm_key_vault_access_policy" "storage" {
  key_vault_id = "/subscriptions/f9f64129-c103-4fb5-a4b5-1e93865d3427/resourceGroups/Fasil_HandsOn_Lab/providers/Microsoft.KeyVault/vaults/imybadkeyfor"
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_storage_account.storage["one"].identity.0.principal_id

  key_permissions    = ["Backup" ,"Create" ,"Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge" ,"Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify" ,"WrapKey"]
  secret_permissions = ["Get"]
  depends_on = [ azurerm_storage_account.storage]
}

resource "azurerm_key_vault_access_policy" "client" {
  key_vault_id ="/subscriptions/f9f64129-c103-4fb5-a4b5-1e93865d3427/resourceGroups/Fasil_HandsOn_Lab/providers/Microsoft.KeyVault/vaults/imybadkeyfor"
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions    = ["Backup" ,"Create" ,"Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge" ,"Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify" ,"WrapKey"]
  secret_permissions = ["Get"]
   depends_on = [ azurerm_storage_account.storage]
}
*/

/*resource "azurerm_key_vault_access_policy" "storage_one" {
  key_vault_id = var.key_vault_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_storage_account.storage["one"].identity.0.principal_id

  key_permissions    = "${var.key_permissions_storage_one}"
  secret_permissions = "${var.secret_permissions_storage_one}"
depends_on = [ azurerm_storage_account.storage]
}

resource "azurerm_key_vault_access_policy" "client_one" {
  key_vault_id = var.key_vault_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions    = "${var.key_permissions_client_one}"
  secret_permissions = "${var.secret_permissions_client_one}"
depends_on = [ azurerm_storage_account.storage]
}

resource "azurerm_key_vault_access_policy" "storage_two" {
  key_vault_id = var.key_vault_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_storage_account.storage["two"].identity.0.principal_id

  key_permissions    = "${var.key_permissions_storage_two}"
  secret_permissions = "${var.secret_permissions_storage_two}"
depends_on = [ azurerm_storage_account.storage]
}

resource "azurerm_key_vault_access_policy" "client_two" {
  key_vault_id = var.key_vault_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions    = "${var.key_permissions_client_two}"
  secret_permissions = "${var.secret_permissions_client_two}"
depends_on = [ azurerm_storage_account.storage]
}



resource "azurerm_key_vault_key" "example" {
  name         = "${var.key_vault_key_name}"
  key_vault_id = var.key_vault_id
  key_type     = "RSA"
  key_size     = 2048
  key_opts     = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]

  depends_on = [
    azurerm_key_vault_access_policy.client_one,
    azurerm_key_vault_access_policy.storage_one,
     azurerm_key_vault_access_policy.client_two,
    azurerm_key_vault_access_policy.storage_two,
  ]
}


resource "azurerm_storage_account_customer_managed_key" "example" {
  storage_account_id = azurerm_storage_account.storage["one"].id
  key_vault_id       = var.key_vault_id
  key_name           = azurerm_key_vault_key.example.name
}*/

/*resource "azurerm_storage_account_customer_managed_key" "exampletwo" {
  storage_account_id = azurerm_storage_account.storage["two"].id
  key_vault_id       = "${var.key_vault_id}"
  key_name           = "${var.key_vault_key_name}"
}*/