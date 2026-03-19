variable "load_balancer" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    frontend_ip_configuration = map(object({
      name           = string
      public_ip_name = string
    }))
  }))
}