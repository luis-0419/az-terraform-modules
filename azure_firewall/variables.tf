variable "firewall_name" {
  description = "The name of the Azure Firewall."
  type        = string
}

variable "location" {
  description = "The Azure region where the Azure Firewall will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Azure Firewall."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the Azure Firewall will be deployed. Must be named 'AzureFirewallSubnet'."
  type        = string
}

variable "sku_name" {
  description = "The SKU name of the firewall. Possible values are 'AZFW_Hub' and 'AZFW_VNet'."
  type        = string
  default     = "AZFW_VNet"
}

variable "sku_tier" {
  description = "The SKU tier of the firewall. Possible values are 'Standard', 'Premium', and 'Basic'."
  type        = string
  default     = "Standard"
}

variable "threat_intel_mode" {
  description = "The threat intelligence mode of the firewall. Possible values are 'Off', 'Alert', and 'Deny'."
  type        = string
  default     = "Alert"
}

variable "pip_sku" {
  description = "The SKU of the public IP address. Possible values are 'Basic' and 'Standard'."
  type        = string
  default     = "Standard"
}

variable "nat_rules" {
  description = "A map of NAT rule collections."
  type = map(object({
    priority = number
    rules = list(object({
      name                  = string
      source_addresses      = list(string)
      destination_ports     = list(string)
      destination_addresses = list(string)
      translated_port       = string
      translated_address    = string
      protocols             = list(string)
    }))
  }))
  default = {}
}

variable "network_rules" {
  description = "A map of network rule collections."
  type = map(object({
    priority = number
    action   = string
    rules = list(object({
      name                  = string
      source_addresses      = list(string)
      destination_addresses = list(string)
      destination_ports     = list(string)
      protocols             = list(string)
    }))
  }))
  default = {}
}

variable "app_rules" {
  description = "A map of application rule collections."
  type = map(object({
    priority = number
    action   = string
    rules = list(object({
      name             = string
      source_addresses = list(string)
      target_fqdns     = list(string)
      protocol_port    = string
      protocol_type    = string
    }))
  }))
  default = {}
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
