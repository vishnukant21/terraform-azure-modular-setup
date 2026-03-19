data "azurerm_subnet" "subnet" {
  for_each             = var.nsg_association
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
    virtual_network_name = each.value.virtual_network_name
}

data "azurerm_network_security_group" "nsg" {
  for_each            = var.nsg_association
  name                = each.value.nsg_name
  resource_group_name = each.value.resource_group_name
}