resource "azurerm_lb_rule" "lb_rule" {
    for_each = var.lb_rule
  loadbalancer_id                = data.azurerm_lb.load_balancer.id
  name                           = each.value.name
  protocol                       = each.value.protocol
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
}