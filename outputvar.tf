/*output "containers" {
value = module.storage.*
}

output "file_shares" {
value = module.storage.file_shares
}

output "storage_account_id" {
value = module.storage.storage_account_id
}
output "storage_account_name" {
value = module.storage.storage_account_name
}*/

/*

output "saID" {
  value = "${azurerm_storage_account.example.id}"
}

output "fsName" {
  value = "${azurerm_storage_share.example.name}"
}


*/
/*
output "storage-account-id" {
  value = { for k, v in azurerm_storage_account.storage : k => v.id }
}



output "primary_blob_endpoint" {
 value = { for k, v in azurerm_storage_account.storage : k => v.primary_blob_endpoint }
  #value = azurerm_storage_account.example.primary_blob_endpoint
}
output "storage_object_id_one" {
 value = azurerm_storage_account.storage["one"].identity.0.principal_id
  #value = azurerm_storage_account.example.primary_blob_endpoint
}

output "storage_object_id_two" {
 value = azurerm_storage_account.storage["two"].identity.0.principal_id
  #value = azurerm_storage_account.example.primary_blob_endpoint
}*/

/*output "primary_blob_endpointdd" {
 value = { for k, v in azurerm_storage_account.storage : k => v.primary_blob_endpoint.identity.0.principal_id }
  #value = azurerm_storage_account.example.primary_blob_endpoint
}*/