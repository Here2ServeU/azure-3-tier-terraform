variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location where the resources will be created"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID where the VM will be placed"
  type        = string
}

variable "vm_size" {
  description = "The size of the VM"
  type        = string
}

variable "instance_count" {
  description = "The number of VM instances"
  type        = number
}

variable "name_prefix" {
  description = "The prefix to use for VM names"
  type        = string
}
