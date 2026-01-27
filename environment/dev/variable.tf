variable "rgs" {
  type = map(object({
    rg_name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))

}

variable "pips" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    tags                = optional(map(string))
  }))
}

variable "networks" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)

    subnet = optional(list(object({
      name             = string
      address_prefixes = list(string)
    })), [])
  }))

}

variable "key_vault" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string

  }))
}

# variable "vms" {
#   type = map(object({
#     nic_name = string
#     location = string
#     resource_group_name = string
#     vm_name = string
#     size = string

#   }))
# }

variable "stg_account" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    tags                = map(string)
  }))
}

variable "mssql_name" {}
variable "resource_group_name" {}
variable "location" {}
variable "administrator_login" {}
variable "administrator_login_password" {}

# variable "name" {
#   description = "name of sql db"
#   default = "sql_db-dev"
# }
# variable "resource_group_name" {
#   description = "name of rg"
#   default = "rg_dev"
# }
# variable "location" {
#   description = "location of db"
#   default = "centralindia"
# }

# variable "mssql_db_name" {}
# variable "server_id" {}
# variable "max_size_gb" {}



