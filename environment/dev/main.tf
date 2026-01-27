module "resource_group" {
  source = "../../module/azurerm_resource_group"
  rgs    = var.rgs
}
module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_public_ip"
  pips       = var.pips

}
module "network" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_networking"
  networks   = var.networks
}
module "key_vault" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_key_vault"
  key_vault  = var.key_vault

}

# module "vms" {
#     source = "../../module/azurerm_compute"
#     vms = var.vms

# }

module "stg_account" {
  depends_on  = [module.resource_group]
  source      = "../../module/azurerm_storage_account"
  stg_account = var.stg_account

}

module "mssql_server" {
  depends_on                   = [module.resource_group]
  source                       = "../../module/azurerm_sql_server"
  mssql_name                   = var.mssql_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}

# module "mssql_db" {
#   depends_on    = [module.mssql_server]
#   source        = "../../module/azurerm_sql_database"
#   mssql_db_name = var.mssql_db_name
#   server_id     = module.mssql_server.mssql_server_id
#   max_size_gb   = var.max_size_gb
# }