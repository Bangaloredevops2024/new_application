data "azurerm_subnet" "subnet" {
  for_each             = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

# output "subnet_id" {
#   value = data.azurerm_subnet.subnet.id
# }

data "azurerm_public_ip" "pip" {
  for_each            = var.vms
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}
# key_vault
data "azurerm_key_vault" "kv" {
  for_each = var.vms
  name                = each.value.key_vault_name
  resource_group_name = each.value.rg_name
}

# output "vault_uri" {
#   value = data.azurerm_key_vault.kv.vault_uri
# }
# key_secret_username
data "azurerm_key_vault_secret" "vm_username" {
  for_each = var.vms
  name         = "vm_username"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

# output "vm_username" {
#   value     = data.azurerm_key_vault_secret.kv.value
#   sensitive = true
# }

# key_secret_password

data "azurerm_key_vault_secret" "vm_password" {
  name         = "vm_password"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

# output "vm_password" {
#   value     = data.azurerm_key_vault_secret.kv.value
#   sensitive = true
# }