# Azure Windows Server related params
winserv_vm_os_publisher     = "MicrosoftWindowsServer"
winserv_vm_os_offer         = "WindowsServer"
winserv_vm_os_sku           = "2022-Datacenter"
winserv_vm_size             = "Standard_DS1_V2"
winserv_license             = "Windows_Server"
winserv_allocation_method   = "Static"
winserv_public_ip_sku       = "Standard"

# Azure Linux Server related params
linux_vm_os_publisher = "Canonical"
linux_vm_os_offer     = "UbuntuServer"
linux_vm_os_sku       = "18.04-LTS"
linux_vm_size         = "Standard_B1s"
linux_ssh_key         = "C:/Users/austi/.ssh/id_rsa.pub"
linux_sa_type         = "Premium_LRS"

# Which Windows administrator password to set during vm customization
winadmin_username = "SuperAdministrator"
winadmin_password = "Password1234"

# Naming Schemes
serv_prefix = "AJB"
winserv_pdc    = "pdc"
winserv_rdc    = "rdc"
winserv_dhcp   = "dhcp"
winserv_file   = "file"
linux_client   = "operator"
