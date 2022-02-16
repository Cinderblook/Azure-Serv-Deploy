# Windows Server Information to Output
output "win_network_interface_private_ip" {
    value = module.windowsservers.network_interface_private_ip
}
output "win_public_ip_address" {
    value = module.windowsservers.public_ip_address
}
output "win_public_ip_dns_name" {
    value = module.windowsservers.public_ip_dns_name
}

# Linux Information to output
output "linux_network_interface_private_ip" {
    value = module.linuxservers.network_interface_private_ip
}
output "linux_public_ip_address" {
    value = module.linuxservers.public_ip_address
}
output "linux_public_ip_dns_name" {
    value = module.linuxservers.public_ip_dns_name
}