rgs = {
  "rg1" = {
    rg_name       = "rg_dev1"
    location   = "central india"
    managed_by = "dev-terraform"
    tags = {
      environment = "dev"
    }
  }
rg2 = {
  rg_name = "rg_prod"
  location = "centralindia"
}

}

pips = {
  "pip_frontend" = {
    name                = "pip_frontend01"
    location            = "central india"
    resource_group_name = "rg_dev"
    allocation_method   = "Static"
    tags = {
      env = "dev"
    }
  }
}

networks = {
  "vnet1" = {
    name                = "vnet_dev"
    location            = "centralindia"
    resource_group_name = "rg_dev"
    address_space       = ["10.0.0.0/16"]

    subnets = [
      {
        name             = "subnet_frontend-vm"
        address_prefixes = ["10.0.1.0/24"]
      },

      {
        name             = "subnet_backend-vm"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]
  }
}

key_vault = {
  "kv1" = {
    name                = "devkitijori"
    location            = "centralindia"
    resource_group_name = "rg_dev"

  }
}

# vms = {
#   "vm1" = {
#     nic_name = "nic-frontend_vm"
#     location ="centralindia"
#     resource_group_name = "rg_dev"
#     vm_name = "frontend_vm"
#     size = "Standard_F2"
#   }
# }

stg_account = {
  "stg_account_01" = {
    name                = "stgbackend1"
    location            = "centralindia"
    resource_group_name = "rg_dev"
    tags = {
      "eng" = "dev"
    }
  }
}

mssql_name                   = "sqlserver-dev"
resource_group_name          = "rg_dev"
location                     = "centralindia"
administrator_login          = "mssql_admin"
administrator_login_password = "Admin@12345"


# mssql_db_name = "mssql_db-dev"
# max_size_gb   = "2"