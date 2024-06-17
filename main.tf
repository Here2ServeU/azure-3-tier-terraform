provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

terraform {
  backend "azurerm" {
    resource_group_name  = "t2s-backend-rg"
    storage_account_name = "t2sbackendstorage"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

# Create the resource group
resource "azurerm_resource_group" "t2s" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source = "./modules/network"

  resource_group_name = azurerm_resource_group.t2s.name
  location            = var.location
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  subnet_names        = var.subnet_names
  subnet_prefixes     = var.subnet_prefixes
}

module "web_server" {
  source = "./modules/compute"

  resource_group_name = azurerm_resource_group.t2s.name
  location            = var.location
  subnet_id           = module.network.subnet_ids[0]
  vm_size             = var.vm_size
  instance_count      = 2
  name_prefix         = "web"
}

module "app_server" {
  source = "./modules/compute"

  resource_group_name = azurerm_resource_group.t2s.name
  location            = var.location
  subnet_id           = module.network.subnet_ids[1]
  vm_size             = var.vm_size
  instance_count      = 2
  name_prefix         = "app"
}

module "db_server" {
  source = "./modules/compute"

  resource_group_name = azurerm_resource_group.t2s.name
  location            = var.location
  subnet_id           = module.network.subnet_ids[2]
  vm_size             = var.vm_size
  instance_count      = 1
  name_prefix         = "db"
}
