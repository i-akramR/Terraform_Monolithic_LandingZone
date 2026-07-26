module "resource_group"{
    source = "../../Child_Module/azurerm_resource_group"
    RGS = var.RGS
}

module "virtual_network" {
    depends_on = [module.resource_group]
    source = "../../Child_Module/azurerm_virtual_network"
    vnets = var.vnets
}

module "subnet"{
    depends_on = [ module.virtual_network ]
    source = "../../Child_Module/azurerm_subnet"
    subnets = var.subnets
}



module "virtual_machine"{
    depends_on = [ module.subnet ]
    source = "../../Child_Module/azurerm_virtual_machine"
    dev_vms = var.dev_vms
}

module "bastion" {
    depends_on = [ module.subnet ]
    source = "../../Child_Module/azurerm_bastion"
    bastion_hosts = var.bastion_hosts
}

module "nat_gateway" {
    depends_on = [ module.subnet ]
    source = "../../Child_Module/azurerm_nat_gateway"
    nat_gateways = var.nat_gateways
}

module "storage_account" {
    depends_on = [ module.resource_group ]
    source = "../../Child_Module/azurerm_storage_account"
    storage_accounts = var.storage_accounts
}

module "application_gateway" {
    depends_on = [ module.subnet ]
    source = "../../Child_Module/azurerm_application_gateway"
    app_gateways = var.app_gateways
}

module "load_balancer" {
    depends_on = [ module.resource_group ]
    source = "../../Child_Module/azurerm_load_balancer"
    load_balancers = var.load_balancers
}