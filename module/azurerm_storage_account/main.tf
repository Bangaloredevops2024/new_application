resource "azurerm_storage_account" "stg" {
    for_each = var.stg_account
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.resource_group_name
    account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = each.value.tags
  
}