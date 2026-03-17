variable "name" {
  description = "The name of the Key Vault."
  type        = string
}

variable "location" {
  description = "The Azure region where the Key Vault will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Key Vault."
  type        = string
}

variable "tenant_id" {
  description = "The Azure Tenant ID."
  type        = string
}

variable "sku_name" {
  description = "The SKU of the Key Vault. Possible values are 'standard' and 'premium'."
  type        = string
  default     = "standard"
}

variable "enabled_for_deployment" {
  description = "Whether to enable deployment for the Key Vault."
  type        = bool
  default     = true
}

variable "enabled_for_disk_encryption" {
  description = "Whether to enable disk encryption for the Key Vault."
  type        = bool
  default     = true
}

variable "enabled_for_template_deployment" {
  description = "Whether to enable template deployment for the Key Vault."
  type        = bool
  default     = true
}

variable "rbac_authorization_enabled" {
  description = "Whether to enable RBAC authorization for the Key Vault."
  type        = bool
  default     = false
}

variable "purge_protection_enabled" {
  description = "Whether to enable purge protection for the Key Vault."
  type        = bool
  default     = false
}

variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained for soft deletion."
  type        = number
  default     = 90
}

variable "network_acls" {
  description = "Network ACLs for the Key Vault."
  type = object({
    default_action             = string
    bypass                     = string
    virtual_network_subnet_ids = optional(list(string))
    ip_rules                   = optional(list(string))
  })
  default = {
    default_action = "Allow"
    bypass         = "AzureServices"
  }
}

variable "access_policies" {
  description = "A map of access policies for the Key Vault."
  type = map(object({
    object_id               = string
    key_permissions         = optional(list(string))
    secret_permissions      = optional(list(string))
    certificate_permissions = optional(list(string))
    storage_permissions     = optional(list(string))
  }))
  default = {}
}

variable "tags" {
  description = "A map of tags to assign to the Key Vault."
  type        = map(string)
  default     = {}
}
