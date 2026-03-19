data "azurerm_subnet" "subnet" {
    for_each = var.bastion
    name                 = each.value.subnet_name
    resource_group_name  = each.value.resource_group_name
    virtual_network_name = "dev-vnet"
}

data "azurerm_public_ip" "pip" {
    for_each = var.bastion
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}