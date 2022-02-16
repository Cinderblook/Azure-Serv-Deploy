## Terraform
Main role: Deploy the Virtual Machines
-   Setup the four Windows Servers (Primary Domain Controller, Replica Domain Controller, DHCP, Fileshare)
<br>

## Prerequisites
- Must install and setup Azure CLI or preferred method of authentication to Azure
<br>

## Terraform Variable files 
-  Alter variables within these files to ensure it meets your needs
    - *variables.tf*
        - Declare variables that will be used with the Terraform configuration
    - *terraform.tfvars*
        - Assign variables that will be used with the Terraform configuration
    - *01-LinuxClient.tf* & *02-WinServers.tf*
        - Ensure variables match up, and alter nb_instance, nb_public_ip number to fit desired number of virtual machines along with public ip addresses to match in Azure
## Azure - Finding variable information for VM Images:
- You can use this command in Azure CLI to find UbuntuServer data. Change the values in offer, publisher, location, and sku for various other images.
 ````Powershell
    az vm image list \
    --location westus \
    --publisher Canonical \  
    --offer UbuntuServer \    
    --sku 18.04-LTS \
    --all --output table
````

-  "Check out Microsoft's" [documentation](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/cli-ps-findimage) on finding VM information


## Terraform process
- Using the Azure provider:
    - Assign appropriate resources to each machine 
- Once prepared with appropriate values and the networking is in place: 
    - Navigate to the Terraform directory and run these commands
    - `terraform init` Pull proper Terraform providers and modules used
    - `terraform validate` This will return whether the configuration is valid or not
    - `terraform apply` ... `yes` Actually apply the configuration

## Terraform Outputs file
- *outputs.tf*
    - Provides necessary ip information that is allocated to the VMs created.
    - This information will be used in the Ansible configuration to identify these machines.

## Useful Terraform Resources
- Terraform [Documentation](https://www.terraform.io/docs)
- Azure[Provider](https://registry.terraform.io/providers/hashicorp/azurerm/2.96.0) & [Module](https://registry.terraform.io/modules/Azure/compute/azurerm/latest)