variable "nic" {
  type = map(object({
    name                 = string
    location             = string
    virtual_network_name = string
    subnet_name          = string
    resource_group_name  = string
    ip_configurations = list(object({
      name                          = string
      private_ip_address_allocation = string
    }))
  }))
}
