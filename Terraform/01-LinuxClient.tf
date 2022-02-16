module "linuxservers" {
  source                           = "Azure/compute/azurerm"
  resource_group_name              = azurerm_resource_group.east.name
  vm_hostname                      = var.serv_prefix
  nb_public_ip                     = 1
  remote_port                      = "22"
  nb_instances                     = 1
  vm_os_publisher                  = var.linux_vm_os_publisher
  vm_os_offer                      = var.linux_vm_os_offer
  vm_os_sku                        = var.linux_vm_os_sku
  vnet_subnet_id                   = module.network.vnet_subnets[0]
  boot_diagnostics                 = true
  delete_os_disk_on_termination    = true
  nb_data_disk                     = 1
  data_disk_size_gb                = 64
  data_sa_type                     = var.linux_sa_type
  enable_ssh_key                   = true
  ssh_key_values                   = ["${var.linux_ssh_key}"]
  vm_size                          = var.linux_vm_size
  delete_data_disks_on_termination = true

  tags = {
    environment = "dev"
    costcenter  = "it"
  }

  enable_accelerated_networking = true
  depends_on = [azurerm_resource_group.east]
}