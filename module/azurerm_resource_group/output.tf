# output "resource_group_idS" {
#   description = "The ID of the created Resource Group."
#   value       = azurerm_resource_group.rg_name.id
# }

output "resource_group_ids" {
  value = values(azurerm_resource_group.rg_name)[*].id
}
