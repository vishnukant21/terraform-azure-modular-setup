variable "nsg_association" {
  type = map(object({
    network_security_group_name = string
    subnet_name                 = string
    nsg_name                    = string
    resource_group_name         = string
    virtual_network_name         = string
  }))
}
