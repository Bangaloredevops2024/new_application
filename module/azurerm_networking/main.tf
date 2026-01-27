resource "azurerm_virtual_network" "vnet" {
    for_each = var.networks
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
#   dns_servers         = ["10.0.0.4", "10.0.0.5"]

  dynamic subnet {
    for_each = each.value.subnet
    content {
      name             =subnet.value.subnet_name
    address_prefixes = subnet.value.address_prefixes
    }
    
  }

}

 