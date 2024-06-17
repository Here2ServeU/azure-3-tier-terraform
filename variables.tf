variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

variable "resource_group_name" {
  default = "t2s-rg"
}

variable "location" {
  default = "East US"
}

variable "vnet_name" {
  default = "t2s-vnet"
}

variable "subnet_names" {
  type = list(string)
  default = ["t2s-web-subnet", "t2s-app-subnet", "t2s-db-subnet"]
}

variable "address_space" {
  default = "172.0.0.0/16"
}

variable "subnet_prefixes" {
  type = list(string)
  default = ["172.0.1.0/24", "172.0.2.0/24", "172.0.3.0/24"]
}

variable "vm_size" {
  default = "Standard_DS1_v2"
}
