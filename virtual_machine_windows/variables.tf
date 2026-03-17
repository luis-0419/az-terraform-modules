variable "name"{
  description = "The name of the virtual machine."
  type        = string
}

variable "location" {
  description = "The Azure region where the virtual machine will be created."
  type        = string
}   

variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual machine."
  type        = string  
  
}

variable "subnet_id" {
  description = "The ID of the subnet in which to create the virtual machine."
  type        = string      
  
}

variable "private_ip_address_allocation" {
  description = "The method used to allocate the private IP address. Possible values are 'Dynamic' and 'Static'."
  type        = string
  default     = "Dynamic"   
  
}

variable "size" {
  description = "The size of the virtual machine. Possible values are 'Standard_F2', 'Standard_B2s', etc."
  type        = string
  default     = "Standard_B2s"      
  
}

variable "admin_username" {
  description = "The admin username for the virtual machine."
  type        = string
  default     = "adminuser"      
  
}

variable "admin_password" {
  description = "The admin password for the virtual machine."
  type        = string
  sensitive   = true
  
}

variable "storage_account_type" {
  description = "The storage account type for the OS disk. Possible values are 'Standard_LRS', 'Premium_LRS', etc."
  type        = string
  default     = "Standard_LRS"      
  
}

variable "publisher" {
  description = "The publisher of the source image. Possible values are 'MicrosoftWindowsServer', etc."
  type        = string
  default     = "MicrosoftWindowsServer"      
  
}

variable "offer" {
  description = "The offer of the source image. Possible values are 'WindowsServer', etc."
  type        = string
  default     = "WindowsServer"      
  
}

variable "sku" {
  description = "The SKU of the source image. Possible values are '2019-Datacenter', '2022-Datacenter', etc."
  type        = string
  default     = "2022-datacenter"      
  
}
