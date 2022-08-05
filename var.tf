/*variable "tags" {
  type = map
  
}
*/

variable "resource_group" {
  description = "resource group name"
  type        = string
  default     = ""
}

variable "location" {
  description = "location "
  type        = string
  default     = ""
}
/*variable "account_tier" {
  description = "account tier "
  type        = string
  default     = ""
}*/
/*variable "endpoint_resource_id" {
  description = "storage account name"
  type        = string
  default     = ""
}*/



variable "storage_accounts" {
  type = map(object({
    storage_account_name = string
    #containers_list       =list(object({ name = string, access_type = string }))
    is_hns_enabled = bool
    #endpoint_resource_id=string
  }))
  default = {
    one = {
      storage_account_name = "dlfjdlvkflvkjj22"
      #containers_list       =list(object({ name = string, access_type = string }))
      is_hns_enabled = false
      #endpoint_resource_id="/subscriptions/f9f64129-c103-4fb5-a4b5-1e93865d3427/resourceGroups/Shravani_HandsOn_Lab/providers/Microsoft.KeyVault/vaults/IdeaLZKeyVaultnew045"
    }
  }
}





  variable "key_vault_id" {
    type  = string
    default =""
  }
  
  /*
  variable "key_vault_key_name" {
    type  = string
    default =""
  }
  */
  /*variable "key_vault_key_name" {
    type  = string
    default =""
  }
 
 
  variable "storage_cmk_key_vault_id" {
    type = string 
    default =""
  }
variable "storage_cmk_key_name" {
   type = string 
    default =""
}





variable "key_permissions_storage_one" {
type =list(string)
  default = [""]
  
  
}

variable "secret_permissions_storage_one" {
type = list(string)
  default = [""]
}

variable "key_permissions_client_one" {
  
default = [""]
 type = list(string)
 }
 variable "secret_permissions_client_one" {
   default = [""]
   type = list(string)
   }



variable "key_permissions_storage_two" {
type =list(string)
  default = [""]
  
  
}

variable "secret_permissions_storage_two" {
type = list(string)
  default = [""]
}

variable "key_permissions_client_two" {
  
default = [""]
 type = list(string)
 }
 variable "secret_permissions_client_two" {
   default = [""]
   type = list(string)
  */ #}
   
   
   variable "tags" {
  description = "The ID of the public subnet"
  default     = {
    name="env"
  }
}