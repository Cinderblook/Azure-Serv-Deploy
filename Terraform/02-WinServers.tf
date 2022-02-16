# Using Windowsservers module for Azure, assign it to create 4 VMs with pre-defined variables
# This pulls the latest Windows Server Datacenter from Microsoft's VM platform directly
module "windowsservers" {
  source                        = "Azure/compute/azurerm"
  resource_group_name           = azurerm_resource_group.east.name
  vm_hostname                   = var.serv_prefix
  is_windows_image              = true
  admin_username                = var.winadmin_username
  admin_password                = var.winadmin_password
  allocation_method             = var.winserv_allocation_method
  public_ip_sku                 = var.winserv_public_ip_sku
  public_ip_dns                 = ["${var.winserv_pdc}","${var.winserv_rdc}","${var.winserv_dhcp}","${var.winserv_file}"]
  nb_public_ip                  = 4
  remote_port                   = "3389"
  nb_instances                  = 4
  vm_os_publisher               = var.winserv_vm_os_publisher
  vm_os_offer                   = var.winserv_vm_os_offer
  vm_os_sku                     = var.winserv_vm_os_sku
  vm_size                       = var.winserv_vm_size
  vnet_subnet_id                = module.network.vnet_subnets[0]
  enable_accelerated_networking = true
  license_type                  = var.winserv_license
  identity_type                 = "SystemAssigned" // can be empty, SystemAssigned or UserAssigned

  depends_on = [azurerm_resource_group.east]
}


