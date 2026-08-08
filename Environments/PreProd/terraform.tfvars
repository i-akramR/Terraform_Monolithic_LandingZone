RGS = {
  RG1 = {
    rg_name     = "RG-Dev"
    rg_location = "centralindia"
  }
   RG2 = {
    rg_name     = "RG-Test"
    rg_location = "centralindia"
  }
}

vnets = {
  vnet1 = {
    name                = "Dev-vnet"
    location            = "centralindia"
    resource_group_name = "RG-Dev"
  }
}

subnets = {
  snet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "RG-Dev"
    virtual_network_name = "Dev-vnet"
  }
  snet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "RG-Dev"
    virtual_network_name = "Dev-vnet"
  }
  snet3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "RG-Dev"
    virtual_network_name = "Dev-vnet"
  }
  snet4 = {
    name                 = "AppGwSubnet"
    resource_group_name  = "RG-Dev"
    virtual_network_name = "Dev-vnet"
  }
}


dev_vms = {
  vm1 = {
    subnet_name         = "frontend-subnet"
    vnet_name           = "Dev-vnet"
    resource_group_name = "RG-Dev"
    location            = "centralindia"
    nic_name            = "frontend-nic1"
    vm_name             = "frontend-vm1"
    vm_size             = "Standard_DS1_v2"
    image_publisher     = "Canonical"
    image_offer         = "0001-com-ubuntu-server-jammy"
    image_sku           = "22_04-lts"
    image_version       = "latest"
    os_name             = "frontend-osdisk1"
    os_caching          = "ReadWrite"
    create_option       = "FromImage"
    managed_disk_type   = "Standard_LRS"
    computer_name       = "hostname"
    admin_username      = "admin"
    admin_password      = "Password1234!"
  }
  vm2 = {
    subnet_name         = "frontend-subnet"
    vnet_name           = "Dev-vnet"
    resource_group_name = "RG-Dev"
    location            = "centralindia"
    nic_name            = "frontend-nic2"
    vm_name             = "frontend-vm2"
    vm_size             = "Standard_DS1_v2"
    image_publisher     = "Canonical"
    image_offer         = "0001-com-ubuntu-server-jammy"
    image_sku           = "22_04-lts"
    image_version       = "latest"
    os_name             = "frontend-osdisk2"
    os_caching          = "ReadWrite"
    create_option       = "FromImage"
    managed_disk_type   = "Standard_LRS"
    computer_name       = "hostname"
    admin_username      = "admin"
    admin_password      = "Password1234!"
  }
  vm3 = {
    subnet_name         = "frontend-subnet"
    vnet_name           = "Dev-vnet"
    resource_group_name = "RG-Dev"
    location            = "centralindia"
    nic_name            = "frontend-nic3"
    vm_name             = "frontend-vm3"
    vm_size             = "Standard_DS1_v2"
    image_publisher     = "Canonical"
    image_offer         = "0001-com-ubuntu-server-jammy"
    image_sku           = "22_04-lts"
    image_version       = "latest"
    os_name             = "frontend-osdisk3"
    os_caching          = "ReadWrite"
    create_option       = "FromImage"
    managed_disk_type   = "Standard_LRS"
    computer_name       = "hostname"
    admin_username      = "admin"
    admin_password      = "Password1234!"
  }
  vm4 = {
    subnet_name         = "backend-subnet"
    vnet_name           = "Dev-vnet"
    resource_group_name = "RG-Dev"
    location            = "centralindia"
    nic_name            = "backend-nic1"
    vm_name             = "backend-vm1"
    vm_size             = "Standard_DS1_v2"
    image_publisher     = "Canonical"
    image_offer         = "0001-com-ubuntu-server-jammy"
    image_sku           = "22_04-lts"
    image_version       = "latest"
    os_name             = "backend-osdisk1"
    os_caching          = "ReadWrite"
    create_option       = "FromImage"
    managed_disk_type   = "Standard_LRS"
    computer_name       = "hostname"
    admin_username      = "admin"
    admin_password      = "Password1234!"
  }
  vm5 = {
    subnet_name         = "backend-subnet"
    vnet_name           = "Dev-vnet"
    resource_group_name = "RG-Dev"
    location            = "centralindia"
    nic_name            = "backend-nic2"
    vm_name             = "backend-vm2"
    vm_size             = "Standard_DS1_v2"
    image_publisher     = "Canonical"
    image_offer         = "0001-com-ubuntu-server-jammy"
    image_sku           = "22_04-lts"
    image_version       = "latest"
    os_name             = "backend-osdisk2"
    os_caching          = "ReadWrite"
    create_option       = "FromImage"
    managed_disk_type   = "Standard_LRS"
    computer_name       = "hostname"
    admin_username      = "admin"
    admin_password      = "Password1234!"
  }
  vm6 = {
    subnet_name         = "backend-subnet"
    vnet_name           = "Dev-vnet"
    resource_group_name = "RG-Dev"
    location            = "centralindia"
    nic_name            = "backend-nic3"
    vm_name             = "backend-vm3"
    vm_size             = "Standard_DS1_v2"
    image_publisher     = "Canonical"
    image_offer         = "0001-com-ubuntu-server-jammy"
    image_sku           = "22_04-lts"
    image_version       = "latest"
    os_name             = "backend-osdisk3"
    os_caching          = "ReadWrite"
    create_option       = "FromImage"
    managed_disk_type   = "Standard_LRS"
    computer_name       = "hostname"
    admin_username      = "admin"
    admin_password      = "Password1234!"
  }
}

bastion_hosts = {
  bastion1 = {
    bastion_name        = "Dev-bastion"
    location            = "centralindia"
    resource_group_name = "RG-Dev"
    subnet_name         = "AzureBastionSubnet"
    vnet_name           = "Dev-vnet"
    pip_name            = "bastion-pip"
  }
}

nat_gateways = {
  natgw1 = {
    natgw_name          = "Dev-natgw"
    location            = "centralindia"
    resource_group_name = "RG-Dev"
    pip_name            = "natgw-pip"
    vnet_name           = "Dev-vnet"
    subnet_names        = ["frontend-subnet", "backend-subnet"]
  }
}

storage_accounts = {
  sa1 = {
    sa_name                  = "devstorageacct202607"
    resource_group_name      = "RG-Dev"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

app_gateways = {
  appgw1 = {
    appgw_name          = "Dev-appgw"
    resource_group_name = "RG-Dev"
    location            = "centralindia"
    subnet_name         = "AppGwSubnet"
    vnet_name           = "Dev-vnet"
    pip_name            = "appgw-pip"
  }
}

load_balancers = {
  lb1 = {
    lb_name             = "Dev-lb"
    resource_group_name = "RG-Dev"
    location            = "centralindia"
    pip_name            = "lb-pip"
  }
}
