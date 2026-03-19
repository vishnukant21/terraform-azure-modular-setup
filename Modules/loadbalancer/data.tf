data "azurerm_public_ip" "pip" {
  name                = "dev-pip"
  resource_group_name = "vishnu-rg"
}
