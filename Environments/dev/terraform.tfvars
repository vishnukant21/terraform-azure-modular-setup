rg_x = {
  "rg1" = {
    name     = "vishnu-rg"
    location = "centralindia"
  }
}

vnet_x = {
  "vnet1" = {
    name                = "dev-vnet"
    location            = "centralindia"
    resource_group_name = "vishnu-rg"
    address_space       = ["10.0.0.0/16"]
  }
}

subnet_x = {
  "subnet1" = {
    name                 = "dev-subnet"
    resource_group_name  = "vishnu-rg"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  "subnet2" = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "vishnu-rg"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

nic_x = {
  "nic1" = {
    name                 = "dev-vm-nic"
    location             = "centralindia"
    virtual_network_name = "dev-vnet"
    subnet_name          = "dev-subnet"
    resource_group_name  = "vishnu-rg"
    ip_configurations = [
      {
        name                          = "ipconfig1"
        private_ip_address_allocation = "Dynamic"
      }
    ]
  }
}

pip_x = {
  "pip1" = {
    name                = "dev-pip"
    location            = "centralindia"
    resource_group_name = "vishnu-rg"
    allocation_method   = "Static"
  }
  "pip2" = {
    name                = "dev-bastion-pip"
    location            = "centralindia"
    resource_group_name = "vishnu-rg"
    allocation_method   = "Static"
  }
}

vm_x = {
  "vm1" = {
    name                            = "dev-vm"
    location                        = "centralindia"
    resource_group_name             = "vishnu-rg"
    size                            = "Standard_D2s_v3"
    admin_username                  = "adminuser"
    admin_password                  = "India@123456"
    disable_password_authentication = false
    network_interface_name          = "dev-vm-nic"

    # custom_data = base64encode(file("cloud-init.sh"))

    os_disk = {
      "os_disk1" = {
        name                 = "dev-os-disk"
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
        disk_size_gb         = 30
      }
    }

    source_image_reference = {
      "image1" = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-LTS"
        version   = "latest"
      }
    }
  }
}

mssql_server_x = {
  "sql1" = {
    name                         = "dev-sql-server2"
    resource_group_name          = "vishnu-rg"
    location                     = "centralindia"
    version                      = "12.0"
    administrator_login          = "sqladmin"
    administrator_login_password = "India@123456"
  }
}

sql_database_x = {
  "db1" = {
    name                = "dev-sql-database"
    resource_group_name = "dev-rg"
    sku_name            = "S0"
    enclave_type        = "VBS"
    max_size_gb         = 2
  }
}

load_balancer_x = {
  "lb1" = {
    name                = "dev-lb"
    location            = "centralindia"
    resource_group_name = "vishnu-rg"
    frontend_ip_configuration = {
      "frontend-ip1" = {
        name           = "frontend-config"
        public_ip_name = "dev-pip"
      }
    }
  }
}

lb_rule = {
  "lb-rule-1" = {
    name                           = "lb-rule-1"
    protocol                       = "Tcp"
    frontend_port                  = 80
    backend_port                   = 80
    frontend_ip_configuration_name = "frontend-config"
  }
}

nsg_x = {
  "nsg1" = {
    name                = "dev-nsg"
    location            = "centralindia"
    resource_group_name = "vishnu-rg"
    security_rule = {
      "rule1" = {
        name                       = "allow-ssh"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "22"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }
}

nsg_association_x = {
  "association1" = {
    network_security_group_name = "dev-nsg"
    subnet_name                 = "dev-subnet"
    nsg_name                    = "dev-nsg"
    resource_group_name         = "vishnu-rg"
    virtual_network_name        = "dev-vnet"
  }
}

bastion_x = {
  "bastion1" = {
    name                = "dev-bastion"
    location            = "centralindia"
    resource_group_name = "vishnu-rg"
    subnet_name         = "AzureBastionSubnet"
    public_ip_name      = "dev-bastion-pip"

  ip_configurations = {
    "ipconfig1" = {
    name = "bastion-ip-config"
    }
   }
  }
}

