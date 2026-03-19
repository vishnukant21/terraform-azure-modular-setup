variable "bastion" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    subnet_name          = string
    public_ip_name       = string
    ip_configurations = map(object({
      name                 = string
    }))
  }))
}