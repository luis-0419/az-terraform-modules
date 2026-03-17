variable "name" {
  description = "The name of the Application Gateway."
  type        = string
}

variable "location" {
  description = "The Azure region where the Application Gateway will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Application Gateway."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet in which to deploy the Application Gateway."
  type        = string
}

variable "sku_name" {
  description = "The SKU name of the Application Gateway (e.g., Standard_v2, WAF_v2)."
  type        = string
  default     = "Standard_v2"
}

variable "sku_tier" {
  description = "The SKU tier of the Application Gateway (e.g., Standard_v2, WAF_v2)."
  type        = string
  default     = "Standard_v2"
}

variable "capacity" {
  description = "The capacity (instance count) for the Application Gateway."
  type        = number
  default     = 2
}

variable "public_ip_allocation_method" {
  description = "The allocation method for the public IP (Static or Dynamic)."
  type        = string
  default     = "Static"
}

variable "public_ip_sku" {
  description = "The SKU of the public IP (Basic or Standard)."
  type        = string
  default     = "Standard"
}

variable "frontend_ports" {
  description = "A map of frontend ports for the Application Gateway."
  type = map(object({
    port = number
  }))
  default = {
    http  = { port = 80 }
    https = { port = 443 }
  }
}

variable "ssl_certificates" {
  description = "A map of SSL certificates for HTTPS listeners."
  type = map(object({
    data                = optional(string)
    key_vault_secret_id = optional(string)
  }))
  default = {}
}

variable "backend_pools" {
  description = "A map of backend address pools."
  type = map(object({
    backend_addresses = list(object({
      ip_address = optional(string)
      fqdn       = optional(string)
    }))
  }))
  default = {}
}

variable "http_settings" {
  description = "A map of backend HTTP settings."
  type = map(object({
    cookie_based_affinity = optional(string)
    port                  = number
    protocol              = string
    request_timeout       = optional(number)
  }))
  default = {}
}

variable "listeners" {
  description = "A map of HTTP listeners."
  type = map(object({
    frontend_port_name      = string
    protocol                = string
    ssl_certificate_name    = optional(string)
  }))
  default = {}
}

variable "routing_rules" {
  description = "A map of request routing rules."
  type = map(object({
    rule_type                  = string
    http_listener_name         = string
    backend_address_pool_name  = optional(string)
    backend_http_settings_name = optional(string)
  }))
  default = {}
}

variable "tags" {
  description = "A map of tags to assign to the Application Gateway."
  type        = map(string)
  default     = {}
}
