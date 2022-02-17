# This pulls a Ubuntu Datacenter from Microsoft's VM platform directly
resource "azurerm_linux_virtual_machine" "operator" {
  name                = var.linux_server
  resource_group_name = azurerm_resource_group.east.name
  location            = azurerm_resource_group.east.location
  size                = var.linux_vm_size
  admin_username      = var.winadmin_username
  network_interface_ids = [
    azurerm_network_interface.linux1.id
  ]

  admin_ssh_key {
    username   = var.winadmin_username
    public_key = file("${var.linux_ssh_key}")
  }

  # Cloud-Init passed here
  #custom_data = ""

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.linux_sa_type
  }

  source_image_reference {
    publisher = var.linux_vm_os_publisher
    offer     = var.linux_vm_os_offer
    sku       = var.linux_vm_os_sku
    version   = "latest"
  }
  depends_on = [azurerm_resource_group.east]
}
/*
# Create cloud-init file to be passed into linux vm
data "template_cloudinit_config" "config" {
  gzip          = true
  base64_encode = true

  # Main cloud-config configuration file.
  part {
    content_type = "text/cloud-config"
    content      = "packages: ['python-pip']"
  }
  part {
    content_type = "text/cloud-config"
    content      = "runcmd: [
      'sudo apt update',
      `sudo apt-get install git'
      'sudo pip install ansible',
      'sudo ansible-galaxy install azure.azure_preview_modules',
      'sudo pip install -r ~/.ansible/roles/azure.azure_preview_modules/files/requirements-azure.txt,'
      ' pip install "pywinrm>=0.2.2"',
      'git clone https://github.com/Cinderblook/Azure-Serv-Deploy.git'
      'cd Azure-Serv-Deploy/Ansible/'
      'ansible-playbook winlab.yml'
      ]"
  }
}
*/