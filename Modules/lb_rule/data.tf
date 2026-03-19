data "azurerm_lb" "load_balancer" {
  name                = "dev-lb"
  resource_group_name = "vishnu-rg"
}