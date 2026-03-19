module "rg" {
  source = "../../Modules/resource_group"
  rg     = var.rg_x
}

module "vnet" {
  source     = "../../Modules/virtual_network"
  vnet       = var.vnet_x
  depends_on = [module.rg]
}

module "subnet" {
  source     = "../../Modules/subnet"
  subnet     = var.subnet_x
  depends_on = [module.vnet]

}

module "nic" {
  source     = "../../Modules/nic"
  nic        = var.nic_x
  depends_on = [module.subnet]

}

module "pip" {
  source     = "../../Modules/public_ip"
  pip        = var.pip_x
  depends_on = [module.rg]

}

module "vm" {
  source = "../../Modules/vm"
  vm     = var.vm_x
  depends_on = [module.nic, module.pip]
}

module "mssql_server" {
  source       = "../../Modules/sql_server"
  mssql_server = var.mssql_server_x
  depends_on   = [module.rg]

}

module "sql_database" {
  source       = "../../Modules/database"
  sql_database = var.sql_database_x
  depends_on   = [module.mssql_server, module.rg]
}

module "load_balancer" {
  source        = "../../Modules/loadbalancer"
  load_balancer = var.load_balancer_x
  depends_on    = [module.rg, module.pip]
  
}

module "lb_rule" {
  source     = "../../Modules/lb_rule"
  lb_rule    = var.lb_rule
  depends_on = [module.load_balancer]
}

module "nsg" {
  source     = "../../Modules/nsg"
  nsg        = var.nsg_x
  depends_on = [module.rg]
}

module "nsg_association" {
  source          = "../../Modules/nsg_association"
  nsg_association = var.nsg_association_x
  depends_on      = [module.nsg, module.subnet]
}

module "bastion" {
  source     = "../../Modules/bastion"
  bastion    = var.bastion_x
  depends_on = [module.rg, module.pip, module.subnet]
}