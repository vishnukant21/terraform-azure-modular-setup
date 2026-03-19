variable "rg_x" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "vnet_x" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  }))

}

variable "subnet_x" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))

}

variable "nic_x" {
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

variable "pip_x" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
  }))
}

variable "vm_x" {
  type = map(object({
    name                            = string
    location                        = string
    resource_group_name             = string
    size                            = string
    admin_username                  = string
    admin_password                  = string
    network_interface_name          = string
    disable_password_authentication = bool
    # custom_data                    = string
    os_disk = map(object({
      name                 = string
      caching              = string
      storage_account_type = string
      disk_size_gb         = number
    }))
    source_image_reference = map(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }))
  }))
}

variable "mssql_server_x" {
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
  }))
}


variable "sql_database_x" {
  type = map(object({
    name                = string
    resource_group_name = string
    sku_name            = string
    enclave_type        = string
    max_size_gb         = number
  }))
}

variable "load_balancer_x" {
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

variable "lb_rule" {
  type        = map(object({
    name                           = string
    protocol                       = string
    frontend_port                  = number
    backend_port                   = number
    frontend_ip_configuration_name = string
  }))
}

variable "nsg_x" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    security_rule = map(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}

variable "nsg_association_x" {
  type = map(object({
    network_security_group_name = string
    subnet_name                 = string
    nsg_name                    = string
    resource_group_name         = string
    virtual_network_name         = string
  }))
}

variable "bastion_x" {
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
