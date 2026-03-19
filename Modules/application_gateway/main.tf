# resource "azurerm_application_gateway" "app_gateway" {
#     for_each = var.application_gateway
#   name                = each.value.name
#   resource_group_name = each.value.resource_group_name
#   location            = each.value.location

#   frontend_port {
#     name = "frontendPort"
#     port = each.value.frontend_port
#   }

#   frontend_ip_configuration {
#     name                 = "frontendIPConfig"
#     public_ip_address_id = data.azurerm_public_ip.pip.id
#   }

#   backend_address_pool {
#     name = "backendAddressPool"
#   }

#   backend_http_settings {
#     name                  = "backendHttpSettings"
#     cookie_based_affinity = "Disabled"
#     port                  = var.application_gateway.backend_port
#     protocol              = "Http"
#   }

#   http_listener {
#     name                           = "httpListener"
#     frontend_ip_configuration_name = "frontendIPConfig"
#     frontend_port_name              = "frontendPort"
#     protocol                        = "Http"
#   }

#   request_routing_rule {
#     name                       = "routingRule"
#     rule_type                  = "Basic"
#     http_listener_name         = "httpListener"
#     backend_address_pool_name  = "backendAddressPool"
#     backend_http_settings_name = "backendHttpSettings"
#   }
  
# }