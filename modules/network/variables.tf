# Inputting The Variables for this Infrastructure

variable "resource_group_name" {}

variable "location" {}

variable "vnet_name" {}

variable "address_space" {}

variable "subnet_names" {
  type = list(string)
}

variable "subnet_prefixes" {
  type = list(string)
}
