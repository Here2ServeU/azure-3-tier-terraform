resource "azurerm_public_ip" "main" {
  count               = var.instance_count
  name                = "${var.name_prefix}-pip-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "main" {
  count               = var.instance_count
  name                = "${var.name_prefix}-nic-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main[count.index].id
  }
}

resource "azurerm_virtual_machine" "main" {
  count               = var.instance_count
  name                = "${var.name_prefix}-vm-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.main[count.index].id]
  vm_size             = var.vm_size

  storage_os_disk {
    name              = "${var.name_prefix}-osdisk-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "${var.name_prefix}-vm-${count.index}"
    admin_username = "azureuser"
    admin_password = "Password1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
